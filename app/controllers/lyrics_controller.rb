class LyricsController < ApplicationController
  allow_unauthenticated_access
  def show
    @song = Song.find(params.expect(:song_id))
  end
end
