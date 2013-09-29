class BrewsController < ApplicationController
  before_action :can_edit_brew, only: [:edit]

  def create
    @brew = default_calendar.brews.build(brew_params)
    if @brew.save
      redirect_to calendar_url
    else
      flash[:danger] = "Unable to create brew card"
      redirect_to calendar_url
    end
  end

  def edit
  end

  def update

  end

  private
    def brew_params
      params.require(:brew).permit(:name,
                                    :description,
                                    :recipe_url,
                                    :og,
                                    :fg,
                                    :name,
                                    :planned_date,
                                    :brewed_on,
                                    :tapped_on,
                                    :status)
    end

    def can_edit_brew
      @brew = Brew.find(params[:id])
      unless current_user? @brew.calendar.user
        redirect_to root_url
      end
    end


end
