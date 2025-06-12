class LikesController < ApplicationController
  allow_unauthenticated_access
  def create
    @like = Like.create!(like_params)
    redirect_to root_path
  end

  def destroy
    Like.find(params.expect(:id)).destroy!
    redirect_to root_path
  end

  private

  def like_params
    params.expect(like: [:song_id])
  end
end
