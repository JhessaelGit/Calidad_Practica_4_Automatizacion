When('hago click en Add to cart desde detalle') do
  product_detail_page.add_to_cart
end

When('ingreso al carrito') do
  cart_page.open
end

Then('deberia ver el producto {string} en el carrito') do |producto_esperado|
  cart_page.validate_product(producto_esperado)
end

Then('deberia ver la descripcion del producto en el carrito {string}') do |descripcion_esperada|
  cart_page.validate_product_description(descripcion_esperada)
end

Then('deberia ver el precio {string} en el carrito') do |precio_esperado|
  cart_page.validate_product_price(precio_esperado)
end
