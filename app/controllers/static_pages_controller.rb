class StaticPagesController < ApplicationController
  def landing
    if current_user?
      redirect_to dashboard_url
    end
  end

  def about
  end

  def faq
  end

  def privacy
  end
end
