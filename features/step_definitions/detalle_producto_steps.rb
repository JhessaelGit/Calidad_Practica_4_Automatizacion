When('hago click en el producto Sauce Labs Backpack') do
  products_page.click_product('Sauce Labs Backpack')
end

Then('el nombre del producto deberia ser {string}') do |nombre_esperado|
  product_detail_page.validate_name(nombre_esperado)
end

Then('la descripcion del producto deberia ser {string}') do |descripcion_esperada|
  product_detail_page.validate_description(descripcion_esperada)
end

Then('el precio del producto deberia ser {string}') do |precio_esperado|
  product_detail_page.validate_price(precio_esperado)
end

Then('deberia existir el boton Add to cart en detalle') do
  product_detail_page.validate_add_to_cart_button
end
