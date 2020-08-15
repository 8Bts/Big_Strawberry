class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User with name #{@user.name} successfully created"
      redirect_to @user
      session[:current_user] = @user.id
    else
      flash[:alert] = "User couldn't be created"
      render :new
    end
  end
 
  def show
    @user = User.find(params[:id])
    @past = @user.attended_events.past
    @upcoming = @user.attended_events.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
