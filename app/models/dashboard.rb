class Dashboard < ActiveRecord::Base
  belongs_to :user
  has_many :brews, dependent: :destroy

  def brew_statuses
    %i(planning fermenting conditioning on-tap)
  end

  def can_add_brews?
    true
  end
end
