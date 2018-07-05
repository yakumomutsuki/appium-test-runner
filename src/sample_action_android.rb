# Author:: Munetaka Oi.
# Copyright:: Copyright (c) 2018 Munetaka Oi
# License:: Ruby license.

require './lib/base_action'

# SampleActionAndroid
class SampleActionAndroid < BaseAction
  def initialize(os_name:, app_name:)
    super
  end

  def tap_App
    @driver.find_element(xpath: '//android.widget.TextView[@content-desc="App"]').click
  end

  def tap_non_exist_elememnt
    @driver.find_element(xpath: '//android.widget.TextView[@content-desc="xxx"]').click
  end
end