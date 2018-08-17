class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_url(:id)
    end
  end

  def create


    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    # debugger
    if @user
      login!(@user)
      redirect_to user_url(:id)
      # render json: "hello"
    else
      flash.now[:errors] = ['Nice try Mr. Hackerman']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


  def session_params
    params.require(:user).permit(:username, :password)
  end

end
