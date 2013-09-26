class UsersController < ApplicationController
  before_action :verify_user, only: [:edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "Welcome, thanks for signing up."
      redirect_to dashboard_url
    else
      flash.now[:alert] = "There was a problem signing up."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit_user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    sign_out
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit( :name,
                                    :email,
                                    :password,
                                    :password_confirmation )          
    end

    def verify_user
      user = User.find_by(id: params[:id])
      unless user && current_user?(user)
        redirect_to root_url
      end
    end
end
