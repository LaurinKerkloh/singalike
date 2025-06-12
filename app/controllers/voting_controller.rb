class VotingController < ApplicationController
  allow_unauthenticated_access
  def index
    @songs = Song.all.ordered_by_likes
  end
end
