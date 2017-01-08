class FollowersController < ApplicationController
  def create
    @follower = current_foodie.followers.build(:follower_id => params[:follower_id])
    if @follower.save
      flash[:notice] = "Added follower."
      redirect_to '/posts'
    else
      flash[:error] = "An error occurred when adding this follower."
      redirect_to '/posts'
    end
  end
  
  def destroy
    @follower = current_foodie.followers.find(params[:follower_id])
    @follower.destroy
    flash[:notice] = "You have successfully deleted this follower."
    redirect_to '/posts'
  end
end