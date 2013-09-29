class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private
    def sign_in(user)
      session[:user_id] = user.id if user
    end

    def sign_out
      if session[:user_id].present?
        session[:user_id] = nil
        flash[:info] = "You have been signed out!"
      end
      redirect_to calendar_url
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def signed_in?
      current_user.present?
    end

    def current_user?(user)
      user == current_user
    end

    def default_calendar
      current_user.calendars.first if signed_in?
    end
end
