Given('que el usuario esta autenticado en la pagina de inventario') do
  login_page.login('standard_user', 'secret_sauce')
  products_page.validate_inventory_page('Products')
end

Given('que estoy en el carrito con el producto {string}') do |product_name|
  products_page.add_product_to_cart(product_name)
  cart_page.open
end

Given('que estoy en el carrito con los siguientes productos:') do |table|
  table.hashes.each do |row|
    products_page.add_product_to_cart(row['producto'])
  end
  cart_page.open
end

Given('que estoy en la pagina de checkout con el producto {string}') do |product_name|
  products_page.add_product_to_cart(product_name)
  cart_page.open
  common_page.click_button_link_or_input('Checkout')
end
