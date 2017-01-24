class FolloweesController < ApplicationController
  before_action :authenticate_user!  

  def index
    @followees = current_foodie.followees
    render 'index.html.erb'
  end
end