class PlaysController < ApplicationController
  def update
    song = Song.find(params.expect(:song_id))
    song.update!(params.expect(song: [:playing]))
    redirect_to root_path
  end
end
