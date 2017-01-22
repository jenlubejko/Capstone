class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @follower = Follower.create(follower_id: current_foodie.id, followee_id: params[:foodie_id])
    # current_foodie.follow(@foodie)

    redirect_to '/foodies'
  end

  def destroy
    @follower = Follower.find_by(id: params[:id])
    # current_foodie.unfollow(@follower)
    @follower.destroy
    redirect_to '/foodies'
  end
end