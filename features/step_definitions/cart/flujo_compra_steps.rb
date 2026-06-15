# --- Steps para el Flujo de Compra y Resumen ---

When('completo el formulario de checkout con los siguientes datos:') do |table|
  checkout_page.fill_information(table.hashes.first)
end

Then('el resumen de pago deberia mostrar los siguientes valores:') do |table|
  checkout_page.validate_payment_summary(table.hashes.first)
end

Then('deberia entrar a la pagina de confirmacion') do
  checkout_page.validate_confirmation_page
end

Then('deberia entrar a la pagina de checkout') do
  checkout_page.validate_information_page
end

Then('deberia entrar a la pagina de resumen') do
  checkout_page.validate_overview_page
end

Then('deberia ver el producto en el carrito') do
  cart_page.validate_cart_page
end

Given('que tengo los siguientes productos en mi carrito:') do |table|
  table.hashes.each do |row|
    products_page.add_product_to_cart(row['producto'])
  end
end
