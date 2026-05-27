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