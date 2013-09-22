class User < ActiveRecord::Base
  validates_presence_of :email, :name
  has_secure_password

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end  
end
