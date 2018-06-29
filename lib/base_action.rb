# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require './lib/base'

# BaseAction
class BaseAction < Base
  def initialize(os_name:)
    super(os_name: os_name)
  end
end
