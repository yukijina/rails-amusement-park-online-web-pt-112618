class SessionsController < ApplicationController

  #root - homepage
  def home
  end

  #login form
  def new
    @user = User.new
    render "signin"
  end

  #login
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  #logout
  def destroy
    if session[:user_id].present?
      session.delete :user_id
      redirect_to root_path
    end
  end


end
