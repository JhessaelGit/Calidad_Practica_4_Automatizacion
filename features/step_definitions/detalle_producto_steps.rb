When('hago click en el producto Sauce Labs Backpack') do
  products_page.validate_product_exists('Sauce Labs Backpack')
  find('.inventory_item_name', text: 'Sauce Labs Backpack').click
end

Then('el nombre del producto deberia ser {string}') do |nombre_esperado|
  product_detail_page.validate_product_info(nombre_esperado, nil)
end

Then('la descripcion del producto deberia ser {string}') do |descripcion_esperada|
  expect(page).to have_css('.inventory_details_desc', text: descripcion_esperada)
end

Then('el precio del producto deberia ser {string}') do |precio_esperado|
  product_detail_page.validate_product_info(nil, precio_esperado)
end

Then('deberia existir el boton Add to cart en detalle') do
  expect(page).to have_button('Add to cart')
end