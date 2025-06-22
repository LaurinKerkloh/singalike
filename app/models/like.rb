class Like < ApplicationRecord
  belongs_to :song

  validates :identifier, uniqueness: {scope: :song_id}

  before_validation :set_identifier

  broadcasts_refreshes_to ->(_) { :likes }

  def set_identifier
    self.identifier = Current.identifier
  end
end
