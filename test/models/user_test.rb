require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Tester",
                        email: "test@test.com",
                        password: "foobar",
                        password_confirmation: "foobar")
  end

  def test_valid
    assert @user.valid?
  end

  def test_invalid_without_name
    @user.name = nil
    refute_valid_user "User should be invalid without a name"
  end

  def test_invalid_without_email
    @user.email = nil
    refute_valid_user "User should be invalid without a email"
  end

  def test_invalid_without_unique_email
    dup_user = User.create(name: "dupe",
                           email: "teST@test.com",
                           password: "foobar",
                           password_confirmation: "foobar")
    refute dup_user.valid?, "User should be invalid with a duplicate email"
  end

  def test_user_default_calendar
    assert @user.respond_to? calendars

    default_calendar = @user.calendars.first
    assert_not_nil default_calendar
    assert_equal "Default", default_calendar.title
  end

  private
    def refute_valid_user(message)
      refute @user.valid?, message
    end
end
