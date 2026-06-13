When('selecciono el filtro {string}') do |filtro|
  products_page.select_filter(filtro)
end

Then('los productos deberian aparecer en este orden {string}') do |orden_esperado|
  products_page.validate_product_order(orden_esperado.split(','))
end

Then('los precios deberian aparecer en este orden {string}') do |orden_esperado|
  products_page.validate_price_order(orden_esperado.split(','))
end
