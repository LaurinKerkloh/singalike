class Song < ApplicationRecord
  has_many :likes

  scope :ordered, -> {
    order(:title)
  }

  scope :ordered_by_likes, -> {
    left_joins(:likes)
      .select("songs.*, COUNT(likes.id) AS likes_count")
      .group(:id)
      .order("likes_count DESC", "songs.title ASC")
  }

  def liked?(identifier = Current.identifier)
    likes.any? { _1.identifier == identifier }
  end

  def like(identifier = Current.identifier)
    likes.find_by(identifier: identifier)
  end
end
