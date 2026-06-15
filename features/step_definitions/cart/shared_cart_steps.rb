# --- Steps Compartidos de la UI del Carrito ---

When('hago click en {string}') do |button_text|
  common_page.click_button_link_or_input(button_text)
end

Then('deberia ver el titulo de la pagina {string}') do |title|
  common_page.validate_title(title)
end

Then('deberia ver el icono del carrito con un {string}') do |number|
  cart_page.validate_badge(number)
end

When('hago click en el icono del carrito') do
  cart_page.open
end

Then('el icono del carrito no deberia mostrar ningun numero') do
  cart_page.validate_badge_empty
end
