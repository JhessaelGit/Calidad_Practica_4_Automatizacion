# --- Steps para Validacion del Formulario de Checkout ---

When('hago click en {string} sin llenar campos') do |button_text|
  common_page.click_button_link_or_input(button_text)
end

Then('deberia ver un mensaje de error que dice {string}') do |message|
  checkout_page.validate_error_message(message)
end

When('ingreso el nombre {string}') do |name|
  checkout_page.fill_first_name(name)
end

When('ingreso el apellido {string}') do |last_name|
  checkout_page.fill_last_name(last_name)
end

When('ingreso el codigo postal {string}') do |postal_code|
  checkout_page.fill_postal_code(postal_code)
end
