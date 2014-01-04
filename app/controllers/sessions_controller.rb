class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are logged out"
  end

  def switch
    session[:user_id] = user_switch_params[:id]
    redirect_to root_url,
      notice: "Switched to #{current_user.name}"
  end

  private
  def user_params
    params.permit(:name, :password)
  end

  def user_switch_params
    params.permit(:id)
  end
end
