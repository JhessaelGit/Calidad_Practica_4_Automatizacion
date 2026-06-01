require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :selenium_chrome_stable do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-gpu')
  options.add_argument('--disable-software-rasterizer')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1920,1080')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :selenium_chrome_stable
Capybara.javascript_driver = :selenium_chrome_stable
Capybara.default_max_wait_time = 10

After do
  begin
    Capybara.current_session.driver.quit
  rescue Selenium::WebDriver::Error::InvalidSessionIdError
  rescue StandardError
  end
end