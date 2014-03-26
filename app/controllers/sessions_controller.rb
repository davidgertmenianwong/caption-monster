class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email].downcase, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Logged In!"
    else
      flash.alert = "Invalid email or password."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
