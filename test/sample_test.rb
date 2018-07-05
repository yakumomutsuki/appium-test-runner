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

  # Fake test
  def test_sample1

    target = '//android.widget.TextView[@content-desc="Accessibility"]'
    element = @action.driver.find_element(xpath: target)
    assert_equal(
      'Accessibility',
      element.text
    )

    element.click

#    @action.click(pkg_name: 'android', component: 'text1')

  rescue StandardError => e
    @action.error_handling(scenario_name: method_name, error_obj: e)
  end
end