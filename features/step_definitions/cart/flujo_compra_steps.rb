# --- Steps para el Flujo de Compra y Resumen ---

When('completo el formulario de checkout con los siguientes datos:') do |table|
  data = table.hashes.first
  find('#first-name').set(data['nombre']) if data['nombre'] && !data['nombre'].empty?
  find('#last-name').set(data['apellido']) if data['apellido'] && !data['apellido'].empty?
  find('#postal-code').set(data['codigo_postal']) if data['codigo_postal'] && !data['codigo_postal'].empty?
end

Then('el resumen de pago deberia mostrar los siguientes valores:') do |table|
  data = table.hashes.first
  expect(page).to have_content("Item total: #{data['subtotal']}") if data['subtotal']
  expect(page).to have_content("Tax: #{data['impuesto']}") if data['impuesto']
  expect(page).to have_content("Total: #{data['total']}") if data['total']
end

Then('deberia entrar a la pagina de confirmacion') do
  expect(page).to have_current_path(/.*checkout-complete\.html/, url: true)
  expect(page).to have_content('Thank you for your order!')
end

Then('deberia entrar a la pagina de checkout') do
  expect(page).to have_current_path(/.*checkout-step-one\.html/, url: true)
  expect(page).to have_selector('#first-name')
end

Then('deberia entrar a la pagina de resumen') do
  expect(page).to have_current_path(/.*checkout-step-two\.html/, url: true)
  expect(page).to have_content('Checkout: Overview')
end

Then('deberia ver el producto en el carrito') do
  expect(page).to have_current_path(/.*cart\.html/, url: true)
end

Given('que tengo los siguientes productos en mi carrito:') do |table|
  table.hashes.each do |row|
    step "que agrego el producto \"#{row['producto']}\" al carrito"
  end
end
