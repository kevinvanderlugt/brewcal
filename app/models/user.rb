class User < ActiveRecord::Base
  validates_presence_of :email, :name
  validates :email, uniqueness: true
  has_secure_password

  has_many :calendars, dependent: :destroy
  before_create :build_calendar

  def email=(value)
    value = value.strip.downcase if value.present?
    write_attribute :email, value
  end  

  private
    def build_calendar
      self.calendars.build title: "Default"
    end
end