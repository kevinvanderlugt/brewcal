require 'test_helper'

class BrewTest < ActiveSupport::TestCase
  def setup
    @brew = Brew.create name: "Awesome Brew!"
  end

  def test_valid
    assert @brew.valid?
  end

  def test_invalid_without_name
    @brew.name = nil
    refute @brew.valid?
  end

  def test_default_status_is_planning
    assert_equal "planning", @brew.status, 
                  "Default planning status should be planning"
  end

  def test_brewed_on_gets_set
    @brew.status="fermenting"
    assert_equal Date.today, @brew.brewed_on,
        "brewed_on should get set on state change to fermenting"
  end

  def test_brewed_on_set_conditioning
    @brew.status="conditioning"
    assert_equal Date.today, @brew.brewed_on,
        "brewed_on should get set on state change to conditioning"
  end

  def test_tapped_on_gets_set
    @brew.status="on-tap"
    assert_equal Date.today, @brew.tapped_on,
        "tapped_on should get set on state change to on-tap"
  end

  def test_planning_brew_status
    @brew.status="planning"
    assert_equal "planned on: #{Date.today}", @brew.recent_brew_status,
      "recent status should be properly formatted"
  end

  def test_fermenting_brew_status
    @brew.status="fermenting"
    assert_equal "brewed on: #{Date.today}", @brew.recent_brew_status,
      "recent status should be properly formatted"
  end

  def test_conditioning_brew_status
    @brew.status="conditioning"
    assert_equal "brewed on: #{Date.today}", @brew.recent_brew_status,
      "recent status should be properly formatted"
  end

  def test_tapped_brew_status
    @brew.status="on-tap"
    assert_equal "tapped on: #{Date.today}", @brew.recent_brew_status,
      "recent status should be properly formatted"
  end
end
