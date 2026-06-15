require 'fileutils'

Before do |scenario|
  puts "Ejecutando escenario: #{scenario.name}"
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  if scenario.failed?
    screenshots_dir = File.join(Dir.pwd, 'reports', 'screenshots')
    FileUtils.mkdir_p(screenshots_dir)

    file_name = scenario.name.downcase.gsub(/[^a-z0-9]+/, '_').gsub(/^_|_$/, '')
    screenshot_path = File.join(screenshots_dir, "#{file_name}.png")

    page.save_screenshot(screenshot_path, full: true)
    attach(File.binread(screenshot_path), 'image/png', File.basename(screenshot_path)) if respond_to?(:attach)
  end
ensure
  begin
    Capybara.current_session.driver.quit
  rescue Selenium::WebDriver::Error::InvalidSessionIdError
  rescue StandardError
  end
end
