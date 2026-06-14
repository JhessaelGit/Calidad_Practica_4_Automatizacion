# --- Steps para el Flujo de Compra y Resumen ---

When('completo el formulario de checkout con los siguientes datos:') do |table|
  data = table.hashes.first
  checkout_step_one_page.fill_information(data['nombre'], data['apellido'], data['codigo_postal'])
end

Then('el resumen de pago deberia mostrar los siguientes valores:') do |table|
  data = table.hashes.first
  checkout_step_two_page.validate_summary(data['subtotal'], data['impuesto'], data['total'])
end

Then('deberia entrar a la pagina de confirmacion') do
  checkout_complete_page.validate_completion
end

Then('deberia entrar a la pagina de checkout') do
  expect(page).to have_current_path(/.*checkout-step-one\.html/)
end

Then('deberia entrar a la pagina de resumen') do
  expect(page).to have_current_path(/.*checkout-step-two\.html/)
end

Then('deberia ver el producto en el carrito') do
  cart_page.validate_on_page
end

Given('que tengo los siguientes productos en mi carrito:') do |table|
  table.hashes.each do |row|
    step "que agrego el producto \"#{row['producto']}\" al carrito"
  end
end
