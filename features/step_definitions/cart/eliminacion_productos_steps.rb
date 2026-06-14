# --- Steps para Eliminación de Productos ---

Given('que agrego el producto {string} al carrito') do |product_name|
  visit 'https://www.saucedemo.com/inventory.html' unless current_url.include?('inventory.html')
  products_page.add_product_to_cart(product_name)
end

When('elimino el producto {string}') do |product_name|
  cart_page.remove_item(product_name)
end

Then('el carrito deberia estar vacio') do
  expect(page).to have_no_selector('.cart_item')
end

Then('el boton del producto {string} en inventario deberia decir {string}') do |product_name, button_text|
  products_page.check_product_button_text(product_name, button_text)
end

When('hago click en {string} para el producto {string} en inventario') do |button_text, product_name|
  if button_text == 'Remove'
    products_page.remove_product_from_cart(product_name)
  else
    products_page.add_product_to_cart(product_name)
  end
end
