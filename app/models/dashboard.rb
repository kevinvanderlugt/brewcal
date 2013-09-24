class Dashboard < ActiveRecord::Base
  belongs_to :user

  def brew_statuses
    %i(planning fermenting conditioning on-tap)
  end
end
