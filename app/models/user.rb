class User < ActiveRecord::Base
  validates_presence_of :email, :name
  validates :email, uniqueness: true
  has_secure_password

  has_many :dashboards, dependent: :destroy
  before_create :build_dashboard

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end  

  private
    def build_dashboard
      self.dashboards.build title: "Default"
    end
end
