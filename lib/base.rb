# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require './lib/resources'

# Base
class Base

  include Resources::Exceptions

  def initialize(os_name:)
    argument_name_check(os_name)
  end
end