# --- Steps para Navegacion General desde el Carrito ---

Then('deberia entrar a la pagina principal y ver los productos disponibles') do
  products_page.validate_inventory_page('Products')
  products_page.validate_complete_products_list
end

When('hago click en el boton de volver a productos') do
  products_page.click_back_to_products
end
