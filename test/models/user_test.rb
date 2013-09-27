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

  def test_user_default_dashboard
    assert @user.respond_to? dashboards

    default_dashboard = @user.dashboards.first
    assert_not_nil default_dashboard
    assert_equal "Default", default_dashboard.title
  end

  private
    def refute_valid_user(message)
      refute @user.valid?, message
    end
end
