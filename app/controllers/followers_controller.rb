class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @follower = Foodie.find(params[:foodie_id])
    current_foodie.follow(@foodie)
    redirect_to '/followers/show_followers.html.erb'
  end

  def destroy
    @follower = Follower.find_by(params[:id]).followed
    current_foodie.unfollow(@follower)
    redirect_to '/followers/show_followers.html.erb'
  end
end