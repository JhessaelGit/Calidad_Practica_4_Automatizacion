# --- Steps para el Background de Swag Labs ---

Given('que el navegador esta abierto en la pagina de inicio de Swag Labs') do
  login_page.visit_page
end

And('el sistema muestra el formulario de inicio de sesion') do
  login_page.validate_login_form
end

When('el usuario ingresa sus credenciales validas:') do |table|
  data = table.hashes.first
  login_page.enter_username(data['usuario'])
  login_page.enter_password(data['contrasena'])
end

And('hace clic en el boton de iniciar sesion') do
  login_page.click_login
end

Then('el usuario es redirigido a la pagina de inventario {string}') do |title|
  products_page.validate_inventory_page(title)
end

And('se visualiza la lista completa de productos para la venta') do
  products_page.validate_complete_products_list
end
