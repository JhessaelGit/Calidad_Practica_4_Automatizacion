# --- Steps para Verificación Detallada de Productos ---

Given('que el carrito de compras se encuentra vacio') do
  visit 'https://www.saucedemo.com/cart.html'
  if page.has_selector?('.cart_item', wait: 2)
    all('.cart_item').each do |item|
      within(item) do
        click_button 'Remove'
      end
    end
  end
  visit 'https://www.saucedemo.com/inventory.html'
end

When(/^(que |)agrego los siguientes productos al carrito:$/) do |_prefix, table|
  table.hashes.each do |row|
    product_name = row['producto']
    within(".inventory_item", text: product_name) do
      click_button 'Add to cart'
    end
  end
end

Then('deberia ver los siguientes productos con sus detalles en el carrito:') do |table|
  unless current_url.include?('cart.html') || current_url.include?('checkout-step-two.html')
    visit 'https://www.saucedemo.com/cart.html'
  end
  table.hashes.each do |row|
    cart_item = find('.cart_item', text: row['producto'])
    expect(cart_item).to have_content(row['precio'])
    if row['descripcion']
      expect(cart_item.text).to include(row['descripcion'])
    end
  end
end

When('hago click en el nombre del producto {string}') do |product_name|
  find(".inventory_item_name", text: product_name).click
end

Then('deberia entrar a la pagina del producto') do
  expect(page).to have_content('Add to cart')
end

Then('deberia ver la pagina de detalle del producto {string}') do |product_name|
  expect(current_url).to include('inventory-item.html')
  expect(page).to have_selector('.inventory_details_name', text: product_name)
end

Then('deberia ver el precio {string} en la pagina de detalle') do |price|
  expect(page).to have_selector('.inventory_details_price', text: price)
end

Then('deberia ver la descripcion del producto en la pagina de detalle') do
  expect(page).to have_selector('.inventory_details_desc')
  desc_text = find('.inventory_details_desc').text
  expect(desc_text.length).to be > 0
end

Then('deberia ver que el boton del producto cambia a {string}') do |button_text|
  expect(page).to have_selector('button', text: button_text)
end

Then('deberia ver la cantidad {string} para el producto {string}') do |qty, product_name|
  cart_item = find('.cart_item', text: product_name)
  within(cart_item) do
    expect(find('.cart_quantity')).to have_content(qty)
  end
end

Then('deberia ver {string} productos listados en el carrito') do |count|
  expect(all('.cart_item').count).to eq(count.to_i)
end
