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
end