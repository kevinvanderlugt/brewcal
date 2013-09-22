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
  end
end
