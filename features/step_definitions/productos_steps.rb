Then('deberia existir la lista de productos') do
  expect(page).to have_selector('#inventory_container > div')
end

Then('deberia existir el producto {string}') do |producto|
  expect(find('#item_4_title_link > div').text).to eq(producto)
end

Then('deberia existir el precio del producto') do
  expect(page).to have_selector(
    '#inventory_container > div > div:nth-child(1) > div.inventory_item_description > div.pricebar > div'
  )
end

Then('deberia existir el boton Add to cart') do
  expect(page).to have_selector('#add-to-cart-sauce-labs-backpack')
end