class VotingController < ApplicationController
  allow_unauthenticated_access
  def index
    @currently_playing = Song.find_by(playing: true)
    @songs = Song.where(playing: false).ordered_by_likes
  end
end
