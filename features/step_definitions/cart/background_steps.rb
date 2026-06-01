# --- Steps para el Background de Swag Labs ---

Given('que el navegador esta abierto en la pagina de inicio de Swag Labs') do
  visit 'https://www.saucedemo.com'
end

And('el sistema muestra el formulario de inicio de sesion') do
  expect(page).to have_selector('#login_button_container')
  expect(page).to have_selector('#user-name')
  expect(page).to have_selector('#password')
end

When('el usuario ingresa sus credenciales validas:') do |table|
  data = table.hashes.first
  find('#user-name').set(data['usuario'])
  find('#password').set(data['contrasena'])
end

And('hace clic en el boton de iniciar sesion') do
  find('#login-button').click
end

Then('el usuario es redirigido a la pagina de inventario {string}') do |title|
  expect(current_url).to include('/inventory.html')
  expect(page).to have_selector('.title', text: title)
end

And('se visualiza la lista completa de productos para la venta') do
  expect(page).to have_selector('.inventory_list')
  expect(all('.inventory_item').count).to be > 0
end
