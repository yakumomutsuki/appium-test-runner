# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require 'em/pure_ruby'
require 'appium_lib'
require 'cgi'
require 'json'
require 'selenium-webdriver'
require 'time'

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

  # When if test close, call this method.
  def quit
    @log.close
    @driver.quit
  end

  # write a error log, xpath info, and save screenshot.
  def error_handling(scenario_name:, error_obj:)
    @log.error(scenario_name.to_s)
    @log.info(fetch_page_source)
    @log.backtrace(error_obj)

    take_screenshot(scenario_name)

    warn(scenario_name.to_s)
    puts fetch_page_source
    raise error_obj
  end

  def take_screenshot(scenario_name)
    png_path = root_dir << "/test/screenshot/#{scenario_name}"
    png_path << "_#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    @driver.save_screenshot png_path
  end

  def fetch_page_source
    sleep 3
    CGI.pretty(@driver.page_source)
  end

  # Action Module
  module Action
    def fetch_text(pkg_name:, component:)
      target = target_string_builder(pkg_name, component)
      wait(target: target)
      @driver.find_element(:id, target).text
    end

    def send_keys(pkg_name:, component:, numbers:)
      target = target_string_builder(pkg_name, component)
      wait(target: target)
      @driver.find_element(:id, target).send_keys(numbers)
    end

    def click(pkg_name:, component:)
      target = target_string_builder(pkg_name, component)
      wait(target: target)
      @driver.find_element(:id, target).click
    end

    # find a component, that will not appear then return false
    # @return true or false
    def component_appearance?(pkg_name:, component:)
      target = target_string_builder(pkg_name, component)
      wait(target: target, timeout: 10)
    rescue Selenium::WebDriver::Error::TimeOutError
      false
    end

    def target_string_builder(resource, id)
      resource + ':id/' + id
    end
  end

  extend Action

  private

  # Wait until element appearing.
  # default timeout is 30 sec.
  def wait(target:, timeout: 30)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_element(:id, target).displayed? }
  end
end
