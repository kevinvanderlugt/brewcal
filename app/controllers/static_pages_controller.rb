class StaticPagesController < ApplicationController
  def landing
    if signed_in?
      redirect_to calendar_url
    end
  end

  def about
  end

  def faq
  end

  def privacy
  end
end
