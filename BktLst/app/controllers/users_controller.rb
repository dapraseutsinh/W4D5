class UsersController < ApplicationController
  def new
    if logged_in?
      render :show
      return
    end

    @user = User.new
    render :new
  end

  def index
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
