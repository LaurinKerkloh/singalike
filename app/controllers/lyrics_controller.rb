class LyricsController < ApplicationController
  allow_unauthenticated_access
  def show
    @song = if params.expect(:song_id) == "current"
      Song.find_by(playing: true)
    else
      Song.find(params.expect(:song_id))
    end
  end
end
