class DashboardsController < ApplicationController
  before_action :set_dashboard, only: :default

  def default
  end

  private
    def set_dashboard
      # Currently the first dashboard is the default
      if signed_in?
        @dashboard = current_user.dashboards.first
      else
        redirect_to signin_url
      end
    end
end
