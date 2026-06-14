require_relative 'base_page'

class CartPage < BasePage
  def validate_on_page
    expect(page).to have_current_path(/.*cart\.html/)
  end

  def checkout
    find('#checkout').click
  end

  def remove_item(product_name)
    # Busca el producto por nombre y hace clic en el botón Remove asociado
    item = find('.cart_item', text: product_name)
    item.find('button', text: 'Remove').click
  end

  def validate_product_in_cart(product_name)
    expect(page).to have_css('.inventory_item_name', text: product_name)
  end
end
