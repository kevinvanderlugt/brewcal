class BrewsController < ApplicationController
  before_action :can_edit_brew, only: [:edit, :update, :destroy]

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
    if @brew.update_attributes(brew_params)
      flash[:success] = "Brew update successfully"
      redirect_to root_url
    else
      flash.now[:danger] = "Unable to update brew"
      render 'edit'
    end
  end

  def destroy
    unless @brew.update_attributes(hidden: true)
      flash.now[:danger] = "Unable to delete brew"
      render 'edit'
    end
    redirect_to root_url
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
