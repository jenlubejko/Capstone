class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    foodie = Foodie.find_by(email: params[:email])
    if foodie && foodie.authenticate(params[:password])
      session[:foodie_id] = foodie.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:foodie_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
