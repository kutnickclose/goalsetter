class UsersController < ApplicationController
  before_filter :require_no_current_user!, :only => [:new, :create]
  before_filter :require_current_user!, :only => [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save

      login!(@user)
      redirect_to user_url(@user)
    else

      flash[:notices] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
