class ResetsController < ApplicationController
  def create
    Like.delete_all
    Song.update_all(playing: false, last_played: nil)

    Turbo::StreamsChannel.broadcast_refresh_later_to(:song)
    redirect_to root_url
  end
end
