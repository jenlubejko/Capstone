class FoodiesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @foodies = Foodie.all
    render 'index.html.erb'
  end

  def new
    @foodie = Foodie.new
    render 'new.html.erb'
  end

  def create
    foodie = Foodie.new(foodie_params)
    if foodie.save
      session[:foodie_id] = foodie.id
      redirect_to '/posts'
    else
      p foodie.errors.full_messages
      redirect_to '/signup'
    end
  end

  def show
    foodie_id = params[:id]
    @foodie = Foodie.find_by(id: foodie_id)
    render 'show.html.erb'
  end

  def followees
    @followees = current_foodie.followees
    render 'followees.html.erb'
  end

  private

  def foodie_params
    params.require(:foodie).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end