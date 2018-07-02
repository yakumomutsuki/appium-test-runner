require 'test/unit'
require './lib/resources'

class ResourcesTest < Test::Unit::TestCase
  include Resources::AppiumOptions

  def test_appium_options
    assert_equal(
      { caps: { deviceName: :android,
                platformName: :android,
                app: "root/android.apk" },
        appium_lib: { wait_timeout: 30,
                      wait_interval: 1 } },
      opts_setting(root: 'root', app_name: 'android.apk', os_name: 'android')
    )

    assert_equal(
      { caps: { deviceName: :iOS,
                platformName: :iOS,
                app: "root/ios.app" },
        appium_lib: { wait_timeout: 30,
                      wait_interval: 1 } },
      opts_setting(root: 'root', app_name: 'ios.app', os_name: 'iOS')
    )
  end
end