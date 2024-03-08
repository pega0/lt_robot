from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.safari.options import Options as SafariOptions
from selenium.webdriver.common.options import ArgOptions


class Utils:
    def get_lambdatest_options_for_mobile(self, platform_name) -> ArgOptions:
        lt_opts_ios = {
            "w3c": True,
            "platformName": "ios",
            "deviceName": "iPhone 13 Pro",
            "platformVersion": "16",
            "network": False,
            "build": "Test build",
            "name": "Test name",
            "tunnel": False,
            "idleTimeout": 600,
            "isRealMobile": True,
            "pageLoadStrategy": "eager",
        }
        lt_opts_android = {
            "w3c": True,
            "platformName": "android",
            "deviceName": "Pixel 7",
            "platformVersion": "13",
            "network": False,
            "build": "Test build",
            "name": "Test name",
            "tunnel": False,
            "idleTimeout": 600,
            "isRealMobile": True,
            "pageLoadStrategy": "eager",
        }
        print(lt_opts_ios)
        if platform_name == "ios":
            options = SafariOptions()
            options.set_capability("LT:options", lt_opts_ios)
            options.capabilities['platformName'] = "ios"
            del options.capabilities['platformName']
        else:
            options = ChromeOptions()
            options.set_capability("LT:options", lt_opts_android)

            prefs = {"autofill.profile_enabled": False}
            options.add_experimental_option("prefs", prefs)

        print(options.capabilities)
        return options
