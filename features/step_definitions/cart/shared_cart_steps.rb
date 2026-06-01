# --- Steps Compartidos de la UI del Carrito ---

When('hago click en {string}') do |button_text|
  if page.has_selector?("button", text: button_text, wait: 2)
    find("button", text: button_text).click
  elsif page.has_selector?("input[value='#{button_text}']", wait: 2)
    find("input[value='#{button_text}']").click
  else
    click_link_or_button button_text
  end
end

Then('deberia ver el titulo de la pagina {string}') do |title|
  expect(page).to have_selector('.title', text: title)
end

Then('deberia ver el icono del carrito con un {string}') do |number|
  expect(page).to have_selector(".shopping_cart_badge", text: number)
end

When('hago click en el icono del carrito') do
  find(".shopping_cart_link", wait: 5).click
end

Then('el icono del carrito no deberia mostrar ningun numero') do
  expect(page).to have_no_selector('.shopping_cart_badge')
end
