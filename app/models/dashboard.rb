class Dashboard < ActiveRecord::Base
  belongs_to :user

  def brew_statuses
    %i(planning brewing fermenting conditioning on-tap)
  end
end
