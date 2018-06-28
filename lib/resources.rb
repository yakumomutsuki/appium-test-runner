# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

module Resources
  module Exceptions
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