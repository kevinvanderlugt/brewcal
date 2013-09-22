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
        @dashboard = current_user.dashboards.first
      else
        redirect_to signin_url
      end
    end
end
