class CalendarsController < ApplicationController
  before_action :set_calendar, only: :default

  def default
  end

  private
    def set_calendar
      # Currently the first calendar is the default
      if signed_in?
        @calendar = current_user.calendars.first
        @brew = Brew.new
      else
        redirect_to signin_url
      end
    end
end
