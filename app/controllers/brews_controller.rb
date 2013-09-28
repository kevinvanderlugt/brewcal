class BrewsController < ApplicationController
  def create
    @brew = default_calendar.brews.build(brew_params)
    if @brew.save
      redirect_to calendar_url
    else
      flash[:danger] = "Unable to create brew card"
      redirect_to calendar_url
    end
  end

  private
    def brew_params
      params.require(:brew).permit(:name,
                                    :description,
                                    :recipe_url,
                                    :og,
                                    :fg,
                                    :name,
                                    :planned_date)
    end
end
