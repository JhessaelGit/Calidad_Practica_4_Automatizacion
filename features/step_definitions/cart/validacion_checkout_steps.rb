# --- Steps para Validación del Formulario de Checkout ---

When('hago click en {string} sin llenar campos') do |button_text|
  step "hago click en \"#{button_text}\""
end

Then('deberia ver un mensaje de error que dice {string}') do |message|
  expect(page).to have_selector('[data-test="error"]', text: message)
end

When('ingreso el nombre {string}') do |name|
  find('#first-name').set(name)
end

When('ingreso el apellido {string}') do |last_name|
  find('#last-name').set(last_name)
end

When('ingreso el codigo postal {string}') do |postal_code|
  find('#postal-code').set(postal_code)
end
