require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'
require_relative '../pages/login_page'
require_relative '../pages/products_page'
require_relative '../pages/cart_page'
require_relative '../pages/checkout_page'
require_relative '../pages/product_detail_page'
require_relative '../pages/common_page'

begin
  require 'webdrivers'
rescue LoadError
  # webdrivers gem is optional; make sure chromedriver is available in PATH or with CHROMEDRIVER_PATH
end

Capybara.register_driver :selenium_chrome_stable do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.binary = ENV['CHROME_BINARY_PATH'] || 'C:/Program Files/Google/Chrome/Application/chrome.exe'

  options.add_argument('--disable-gpu')
  options.add_argument('--disable-software-rasterizer')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1920,1080')
  options.add_argument('--password-store=basic')
  options.add_argument('--disable-features=PasswordManagerOnboarding')
  options.add_argument('--disable-features=AutofillServerCommunication')

  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)
  options.add_preference('profile.password_manager_leak_detection', false)

  service = Selenium::WebDriver::Service.chrome
  service.path = ENV['CHROMEDRIVER_PATH'] if ENV['CHROMEDRIVER_PATH']

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    service: service
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

module PageObjects
  def login_page
    @login_page ||= LoginPage.new
  end

  def products_page
    @products_page ||= ProductsPage.new
  end

  def cart_page
    @cart_page ||= CartPage.new
  end

  def checkout_page
    @checkout_page ||= CheckoutPage.new
  end

  def product_detail_page
    @product_detail_page ||= ProductDetailPage.new
  end

  def common_page
    @common_page ||= CommonPage.new
  end
end

World(PageObjects)
