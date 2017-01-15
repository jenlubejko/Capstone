class FoodiesController < ApplicationController
  def index
    @foodies = Foodie.all
    render 'index.html.erb'
  end

  def new
    @foodie = current_foodie
    render 'new.html.erb'
  end

  def create
    foodie = Foodie.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if foodie.save
      session[:foodie_id] = foodie.id
      flash[:success] = 'You have successfully created an account!'
      redirect_to '/posts'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def followers
    @foodie = Foodie.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_followers.html.erb'
  end

  def followees
    @foodie = Foodie.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_followers.html.erb'
  end
end