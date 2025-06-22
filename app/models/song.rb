class Song < ApplicationRecord
  has_many :likes

  scope :ordered, -> {
    order(:title)
  }

  scope :next_up, -> {
    left_joins(:likes)
      .select("songs.*, COUNT(likes.id) AS likes_count")
      .group(:id)
      .having("likes_count >= 1")
      .order("likes_count DESC", "songs.title ASC")
  }

  before_save :set_last_played, if: -> { playing_changed?(from: true, to: false) }
  after_save :ensure_only_one_playing, if: -> { playing_previously_changed?(to: true) }
  after_save :remove_likes, if: -> { playing_previously_changed?(to: true) }

  after_create_commit -> { broadcast_refresh_later_to(:songs) }
  after_update_commit -> { broadcast_refresh_later_to(:songs) }
  after_destroy_commit -> { broadcast_refresh_later_to(:songs) }

  def liked?(identifier = Current.identifier)
    likes.any? { _1.identifier == identifier }
  end

  def like(identifier = Current.identifier)
    likes.find_by(identifier: identifier)
  end

  private

  def ensure_only_one_playing
    Song.transaction do
      Song.where.not(id: id).where(playing: true).find_each do |song|
        unless song.update(playing: false)
          raise ActiveRecord::Rollback, "Failed to update song ##{song.id}"
        end
      end
    end
  end

  def remove_likes
    likes.destroy_all
  end

  def set_last_played
    self.last_played = Time.zone.now
  end
end
