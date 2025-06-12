class Like < ApplicationRecord
  belongs_to :song

  validates :identifier, uniqueness: {scope: :song_id}

  before_validation :set_identifier

  after_create_commit -> { broadcast_refresh_later_to(:likes) }
  after_destroy_commit -> { broadcast_refresh_later_to(:likes) }

  def set_identifier
    self.identifier = Current.identifier
  end
end
