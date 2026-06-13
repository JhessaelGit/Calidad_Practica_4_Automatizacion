# --- Steps para Eliminacion de Productos ---

Given('que agrego el producto {string} al carrito') do |product_name|
  products_page.add_product_to_cart(product_name)
end

When('elimino el producto {string}') do |product_name|
  cart_page.remove_product(product_name)
end

Then('el carrito deberia estar vacio') do
  cart_page.validate_empty
end

Then('el boton del producto {string} en inventario deberia decir {string}') do |product_name, button_text|
  products_page.validate_product_button_text(product_name, button_text)
end

When('hago click en {string} para el producto {string} en inventario') do |button_text, product_name|
  products_page.click_product_button(button_text, product_name)
end
