class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      flash[:success] = "You have signed in"
      sign_in user
      redirect_to dashboard_url
    else
      flash.now[:error] = "Incorrect email/password combination"
      render 'new'
    end
  end

  def destroy
    if session[:user_id].present?
      session[:user_id] = nil
      flash[:alert] = "You have been signed out!"
    end
    redirect_to dashboard_url
  end
end
