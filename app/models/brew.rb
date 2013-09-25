class Brew < ActiveRecord::Base
  belongs_to :dashboard

  validates_presence_of :name

  def recent_brew_status
    "to brew: 04-25-2013"
  end
end
