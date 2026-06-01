# --- Steps para Navegación General desde el Carrito ---

Then('deberia entrar a la pagina principal y ver los productos disponibles') do
  step 'el usuario es redirigido a la pagina de inventario "Products"'
  step 'se visualiza la lista completa de productos para la venta'
end

When('hago click en el boton de volver a productos') do
  find('button[id="back-to-products"]').click
end
