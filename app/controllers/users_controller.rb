class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

 #signup form
  def new
    @user = User.new
  end

 #signup and then log in
  def create
    @user = User.new(user_params)
    if @user && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if params[:attraction_id]
      @attraction = Attraction.find_by(id: params[:attraction_id])
      @user.attractions << @attraction
      flash[:message] = @user.rides.last.take_ride
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end

    def require_login
      #return head(:forbidden) unless session.include? :user_id
      redirect_to root_path unless session.include? :user_id
    end


end
