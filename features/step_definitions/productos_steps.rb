Then('deberia existir la lista de productos') do
  products_page.validate_products_list
end

Then('deberia existir el producto {string}') do |producto|
  products_page.validate_product_exists(producto)
end

Then('deberia existir el precio del producto') do
  products_page.validate_product_price
end

Then('deberia existir el boton Add to cart') do
  products_page.validate_add_to_cart_button
end