# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

module Resources
  # Exceptions
  module Exceptions
    def argument_name_check(os_name)
      return if %w[ios android].include?(os_name.downcase)
      e = WrongNameArgumentException.new 'iOS or Android'
      raise e
    end

    # WrongNameArgumentException
    class WrongNameArgumentException < RuntimeError
      def initialize(comment)
        msg = 'WrongNameArgumentException: Wrong name argument is set.'
        msg << " Please set either #{comment}."
        warn(msg)
      end
    end
  end

  # AppiumOptions
  module AppiumOptions
    def opts_setting(root:, os_name:, app_name:)
      opts = { caps: {},
               appium_lib: { wait_timeout: 30, wait_interval: 1 } }
      app_path = "#{root}/#{app_name}"
      opts[:caps] = if os_name.casecmp('android').zero?
                      os_name_setting(:android, app_path)
                    else
                      os_name_setting(:iOS, app_path)
                    end
      opts
    end

    private

    def os_name_setting(os_name, app_path)
      { deviceName: os_name, platformName: os_name, app: app_path }
    end
  end
end