When('hago click en el producto Sauce Labs Backpack') do
  find('#item_4_title_link > div').click
end

Then('el nombre del producto deberia ser {string}') do |nombre_esperado|
  nombre_actual = find('#inventory_item_container > div > div > div.inventory_details_desc_container > div.inventory_details_name.large_size').text
  expect(nombre_actual).to eq(nombre_esperado)
end

Then('la descripcion del producto deberia ser {string}') do |descripcion_esperada|
  descripcion_actual = find('#inventory_item_container > div > div > div.inventory_details_desc_container > div.inventory_details_desc.large_size').text
  expect(descripcion_actual).to eq(descripcion_esperada)
end

Then('el precio del producto deberia ser {string}') do |precio_esperado|
  precio_actual = find('#inventory_item_container > div > div > div.inventory_details_desc_container > div.inventory_details_price').text
  expect(precio_actual).to eq(precio_esperado)
end

Then('deberia existir el boton Add to cart en detalle') do
  expect(page).to have_selector('#add-to-cart')
end