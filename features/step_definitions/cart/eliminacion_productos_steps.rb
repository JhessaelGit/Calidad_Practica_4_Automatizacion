# --- Steps para Eliminación de Productos ---

Given('que agrego el producto {string} al carrito') do |product_name|
  visit 'https://www.saucedemo.com/inventory.html' unless current_url.include?('inventory.html')
  within(".inventory_item", text: product_name) do
    click_button 'Add to cart'
  end
end

When('elimino el producto {string}') do |product_name|
  within(".cart_item", text: product_name) do
    click_button 'Remove'
  end
end

Then('el carrito deberia estar vacio') do
  expect(page).to have_no_selector('.cart_item')
end

Then('el boton del producto {string} en inventario deberia decir {string}') do |product_name, button_text|
  within(".inventory_item", text: product_name) do
    expect(page).to have_selector('button', text: button_text)
  end
end

When('hago click en {string} para el producto {string} en inventario') do |button_text, product_name|
  within(".inventory_item", text: product_name) do
    click_button button_text
  end
end
