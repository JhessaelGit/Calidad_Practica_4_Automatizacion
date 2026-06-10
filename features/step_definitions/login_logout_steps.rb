When('abro el menu lateral') do
  products_page.open_sidebar
end

When('hago click en Logout') do
  products_page.logout
end

When('hago click en About') do
  products_page.go_to_about
end

Then('deberia volver al login') do
  expect(page).to have_current_path('/', url: false)
  expect(page).to have_selector('#login-button')
end

Then('deberia redirigirme a la pagina de Sauce Labs') do
  expect(page).to have_current_path(%r{https://saucelabs\.com/?}, url: true)
end
