class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @followers = Follower.all
    render 'index.html.erb'
  end

  def create
    @follower = Follower.create(follower_id: current_foodie.id, followee_id: params[:foodie_id])
    redirect_to '/foodies'
  end

  def destroy
    @follower = Follower.find_by(id: params[:id])
    @follower.destroy
    redirect_to '/foodies'
  end
end