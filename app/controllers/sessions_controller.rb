class SessionsController < ApplicationController


  def new
  end

  def create
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   sessioon[:user_id] = user.id
    #   else
    #      flash.now.alert = "Invalid email or password"
    #      render "new"
    #   end
    #
    if authenticated?
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def authenticated?
    @user = User.find_by_email params[:email]
    if @user
      true
    else
      false
    end
  end


end