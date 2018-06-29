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
    log_path = "#{root_dir}/test/logs/#{Time.now.strftime('%Y%m%d')}.log"
    @log = CustomLogger.new(log_path)
  end

  # Get root => .~/appium-test-runner/
  def root_dir
    __FILE__.match(%r{.*(appium-test-runner)}).to_s
  end
end