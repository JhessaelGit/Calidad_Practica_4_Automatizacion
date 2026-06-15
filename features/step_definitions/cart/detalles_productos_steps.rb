# --- Steps para Verificacion Detallada de Productos ---

Given('que el carrito de compras se encuentra vacio') do
  cart_page.clear
  products_page.visit_page
end

When(/^(que |)agrego los siguientes productos al carrito:$/) do |_prefix, table|
  table.hashes.each do |row|
    products_page.add_product_to_cart(row['producto'])
  end
end

Then('deberia ver los siguientes productos con sus detalles en el carrito:') do |table|
  cart_page.validate_products_details(table.hashes)
end

When('hago click en el nombre del producto {string}') do |product_name|
  products_page.click_product(product_name)
end

Then('deberia entrar a la pagina del producto') do
  product_detail_page.validate_loaded
end

Then('deberia ver la pagina de detalle del producto {string}') do |product_name|
  product_detail_page.validate_product_page(product_name)
end

Then('deberia ver el precio {string} en la pagina de detalle') do |price|
  product_detail_page.validate_price(price)
end

Then('deberia ver la descripcion del producto en la pagina de detalle') do
  product_detail_page.validate_description_present
end

Then('deberia ver que el boton del producto cambia a {string}') do |button_text|
  product_detail_page.validate_button_text(button_text)
end

Then('deberia ver la cantidad {string} para el producto {string}') do |qty, product_name|
  cart_page.validate_product_quantity(product_name, qty)
end

Then('deberia ver {string} productos listados en el carrito') do |count|
  cart_page.validate_items_count(count)
end
