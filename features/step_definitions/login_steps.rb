Given('que estoy en la pagina de login') do
  login_page.visit_page
end

When('ingreso el username {string}') do |username|
  login_page.enter_username(username)
end

When('ingreso el password {string}') do |password|
  login_page.enter_password(password)
end

When('hago click en Login') do
  login_page.click_login
end

Then('deberia entrar a la pagina principal') do
  login_page.validate_login_success
end