require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :selenium_chrome_stable do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # Ruta de Chrome en macOS
  options.binary = ENV['CHROME_BINARY_PATH'] || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'

  # Configuración general
  options.add_argument('--window-size=1920,1080')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--no-sandbox')

  # Desactivar popups molestos de Chrome
  options.add_argument('--disable-save-password-bubble')
  options.add_argument('--disable-password-generation')
  options.add_argument('--disable-notifications')

  # Desactivar detección de contraseñas filtradas
  options.add_argument('--disable-features=PasswordLeakDetection,PasswordManagerOnboarding,AutofillServerCommunication')

  # Desactivar Password Manager
  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)
  options.add_preference('profile.password_manager_leak_detection', false)

  # Opcional: ejecutar headless
  # options.add_argument('--headless=new')

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :selenium_chrome_stable
Capybara.javascript_driver = :selenium_chrome_stable

# Tiempo máximo de espera para elementos dinámicos
Capybara.default_max_wait_time = 10

# Hooks de limpieza
After do
  Capybara.current_session.driver.quit
rescue StandardError
end