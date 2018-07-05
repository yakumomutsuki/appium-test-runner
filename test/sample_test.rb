# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require 'test/unit'
require './src/sample_action_android'

class SampleTest < Test::Unit::TestCase

  APP_PATH = ENV['SAUCE_LABS'] ? 'http://appium.github.io/appium/assets/ApiDemos-debug.apk' : '../apps/ApiDemos-debug.apk'

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @action = SampleActionAndroid.new(os_name: 'android',
                                      app_name: APP_PATH)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
    @action.quit
  end

  # Sample test
  def test_sample1

    # Search Accessibility Area
    target = '//android.widget.TextView[@content-desc="Accessibility"]'
    element = @action.driver.find_element(xpath: target)
    assert_equal(
      'Accessibility',
      element.text
    )

    # Using the tap_App method implemented in SampleActionAndroid class,
    # transit to screen.
    @action.tap_App

    # Search Action Bar Area
    target = '//android.widget.TextView[@content-desc="Action Bar"]'
    element = @action.driver.find_element(xpath: target)
    assert_equal(
      'Action Bar',
      element.text
    )

  rescue StandardError => e
    @action.error_handling(scenario_name: method_name, error_obj: e)
  end

  # Sample test
  # expected value is wrong
  def test_sample2

    # Search Accessibility Area
    target = '//android.widget.TextView[@content-desc="Accessibility"]'
    element = @action.driver.find_element(xpath: target)
    assert_equal(
      'App',
      element.text
    )

  rescue StandardError => e
    @action.error_handling(scenario_name: method_name, error_obj: e)
  end

  # Sample test
  # catch the error
  def test_sample3

    @action.tap_non_exist_elememnt

  rescue StandardError => e
    @action.error_handling(scenario_name: method_name, error_obj: e)
  end
end