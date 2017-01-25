class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    foodie = Foodie.find_by(email: params[:email])
    if foodie && foodie.authenticate(params[:password])
      session[:foodie_id] = foodie.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:foodie_id] = nil
    redirect_to '/login'
  end
end