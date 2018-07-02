# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require 'test/unit'
require './lib/base_action'

class SampleTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @action = BaseAction.new(os_name: 'android', app_name: 'test.apk')
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

  # Fake test
  def test_one
    @action.take_screenshot(method_name)
  end
end