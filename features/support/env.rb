require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 5