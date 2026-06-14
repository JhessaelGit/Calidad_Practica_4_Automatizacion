When('hago click en Add to cart desde detalle') do
  product_detail_page.add_to_cart
end

When('ingreso al carrito') do
  find('.shopping_cart_link').click
end

Then('deberia ver el producto {string} en el carrito') do |producto_esperado|
  cart_page.validate_product_in_cart(producto_esperado)
end

Then('deberia ver la descripcion del producto en el carrito {string}') do |descripcion_esperada|
  expect(page).to have_css('.inventory_item_desc', text: descripcion_esperada)
end

Then('deberia ver el precio {string} en el carrito') do |precio_esperado|
  expect(page).to have_css('.inventory_item_price', text: precio_esperado)
end