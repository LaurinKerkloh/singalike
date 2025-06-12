class LikesController < ApplicationController
  allow_unauthenticated_access
  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to root_path, notice: "Like was successfully created."
    else
      redirect_to root_path, alert: "Error."
    end
  end

  def destroy
    Like.find(params.expect(:id)).destroy!
    redirect_to root_path, status: :see_other, notice: "Like was successfully destroyed."
  end

  private

  def like_params
    params.expect(like: [:song_id])
  end
end
