class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcome, thanks for signing up."
      redirect_to dashboard_url
    else
      flash.now[:alert] = "There was a problem signing up."
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit( :name,
                                    :email,
                                    :password,
                                    :password_confirmation )          
    end
end
