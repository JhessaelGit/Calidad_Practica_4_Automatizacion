When('selecciono el filtro {string}') do |filtro|
  find('.product_sort_container').select(filtro)
  sleep 1
end

Then('los productos deberian aparecer en este orden {string}') do |orden_esperado|
  productos_esperados = orden_esperado.split(',')
  productos_actuales = all('.inventory_item_name', minimum: 6).map(&:text)

  expect(productos_actuales).to eq(productos_esperados)
end

Then('los precios deberian aparecer en este orden {string}') do |orden_esperado|
  precios_esperados = orden_esperado.split(',')
  precios_actuales = all('.inventory_item_price', minimum: 6).map(&:text)

  expect(precios_actuales).to eq(precios_esperados)
end