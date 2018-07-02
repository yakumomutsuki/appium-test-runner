require 'test/unit'
require './lib/base_action'

class SampleTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @action = BaseAction.new(os_name: 'ios', app_name: 'test.apk')
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_one


  end
end