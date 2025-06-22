class VotingController < ApplicationController
  allow_unauthenticated_access
  def index
    @currently_playing = Song.find_by(playing: true)
    @next_up = Song.includes(:likes).where(playing: false).next_up.limit(5)
    @songs = Song.includes(:likes).ordered
  end
end
