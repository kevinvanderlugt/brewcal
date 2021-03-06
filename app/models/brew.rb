class Brew < ActiveRecord::Base
  after_initialize :init

  belongs_to :calendar
  validates_presence_of :name

  def status=(value)
    value = value.strip.downcase
    case value
    when "fermenting"
      self.brewed_on ||= Date.today
    when "conditioning"
      self.brewed_on ||= Date.today
    when "on-tap"
      self.tapped_on ||= Date.today
    end
    write_attribute :status, value
  end

  def recent_brew_status
    case status
    when "planning"
      "planned on: #{planned_date}"
    when "fermenting"
      "brewed on: #{brewed_on}"
    when "conditioning"
      "brewed on: #{brewed_on}"
    when "on-tap"
      "tapped on: #{tapped_on}"
    end
  end

  def short_description
    description.truncate(100)
  end
  
  def belongs_to_current_user?
    self.calendar.current_users_dashboard?
  end

  private
    def init
      self.status ||= "planning"
      self.planned_date ||= Date.today
    end


end
