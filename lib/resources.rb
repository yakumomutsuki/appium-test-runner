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
                      { deviceName: :android,
                        platformName: :android,
                        app: app_path }
                    else
                      { deviceName: :iOS,
                        platformName: :iOS,
                        app: app_path }
                    end
      opts
    end
  end
end