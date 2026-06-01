When('hago click en Add to cart desde detalle') do
  find('#add-to-cart').click
end

When('ingreso al carrito') do
  find('#shopping_cart_container > a').click
end

Then('deberia ver el producto {string} en el carrito') do |producto_esperado|
  producto_actual = find('#item_4_title_link > div').text
  expect(producto_actual).to eq(producto_esperado)
end

Then('deberia ver la descripcion del producto en el carrito {string}') do |descripcion_esperada|
  descripcion_actual = find('#cart_contents_container > div 
                              > div.cart_list > div.cart_item >
                               div.cart_item_label > 
                               div.inventory_item_desc').text
  expect(descripcion_actual).to eq(descripcion_esperada)
end

Then('deberia ver el precio {string} en el carrito') do |precio_esperado|
  precio_actual = find('#cart_contents_container > div > div.cart_list > div.cart_item > div.cart_item_label > div.item_pricebar > div').text
  expect(precio_actual).to eq(precio_esperado)
end