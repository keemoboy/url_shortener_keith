class SessionsController < ApplicationController

  def new
  end

  def create

    if authenticated?
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def authenticated?
    @user = User.find_by_email params[:email]
    if @user and @user.authenticate(params[:password])
      true
    else
      false
    end
  end


end