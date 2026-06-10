require_relative 'base_page'

class LoginPage < BasePage
  def visit_page
    visit 'https://www.saucedemo.com'
  end

  def enter_username(username)
    find('#user-name').set(username)
  end

  def enter_password(password)
    find('#password').set(password)
  end

  def click_login
    find('#login-button').click
  end

  def login(username, password)
    visit_page
    enter_username(username)
    enter_password(password)
    click_login
  end

  def validate_login_success
    expect(page).to have_current_path('/inventory.html', url: false)
    expect(page).to have_content('Products')
  end
end
