Given('que estoy en la pagina de login') do
  visit 'https://www.saucedemo.com'
end

When('ingreso el username {string}') do |username|
  find('#user-name').set(username)
end

When('ingreso el password {string}') do |password|
  find('#password').set(password)
end

When('hago click en Login') do
  find('#login-button').click
end

Then('deberia entrar a la pagina principal') do
  expect(page).to have_current_path('/inventory.html', url: false)
  expect(page).to have_content('Products')
end

When('abro el menu lateral') do
  find('#react-burger-menu-btn').click
end

When('hago click en Logout') do
  find('#logout_sidebar_link').click
end

Then('deberia volver al login') do
  expect(page).to have_current_path('/', url: false)
  expect(page).to have_selector('#login-button')
end