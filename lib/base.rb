# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require './resources'
require './custom_logger'

# Base Class
#   Implements of Log, check on argument.class Base
#   When argument is wrong then raise error
class Base

  include Resources::Exceptions

  attr_accessor :log

  def initialize(os_name:)
    argument_name_check(os_name)

    @dir = __FILE__.match(%r{.*(appium-test-runner)}).to_s # can get => ".~/appium/"
    @log = CustomLogger.new("#{@dir}/test/logs/#{Time.now.strftime('%Y%m%d')}.log")
  end
end

