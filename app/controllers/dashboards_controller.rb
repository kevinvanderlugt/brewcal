class DashboardsController < ApplicationController
  before_action :set_dashboard, only: :default

  def index
  end

  def show
  end

  def default
  end

  private
    def set_dashboard
      # Currently the first dashboard is the default
      if current_user?
        @dashboard = current_user.dashboards.find(1).first
      else
        redirect_to signup_url
      end
    end
end
