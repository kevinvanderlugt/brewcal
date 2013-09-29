class Calendar < ActiveRecord::Base
  belongs_to :user
  has_many :brews, dependent: :destroy

  def brew_statuses
    %i(planning fermenting conditioning on-tap)
  end

  def brews_with_status(status)
    brews.where(status: status)
  end

  def current_users_dashboard?
    current_user? user
  end
end
