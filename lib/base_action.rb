# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require 'appium_lib'
require 'cgi'
require 'em/pure_ruby'
require 'selenium-webdriver'

require './lib/base'

# BaseAction
class BaseAction < Base
  include Resources::AppiumOptions

  attr_accessor :driver

  def initialize(os_name:, app_name:)
    super
    opts = opts_setting(root: root_dir, os_name: os_name, app_name: app_name)
    @driver = Appium::Driver.new(opts, true).start_driver
  end
end
