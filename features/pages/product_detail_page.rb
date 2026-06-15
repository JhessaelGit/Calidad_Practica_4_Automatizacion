require_relative 'base_page'

class ProductDetailPage < BasePage
  def add_to_cart
    find('#add-to-cart').click
  end

  def validate_loaded
    expect(page).to have_content('Add to cart')
  end

  def validate_product_page(product_name)
    expect(current_url).to include('inventory-item.html')
    expect(page).to have_selector('.inventory_details_name', text: product_name)
  end

  def validate_name(expected_name)
    expect(find('.inventory_details_name').text).to eq(expected_name)
  end

  def validate_description(expected_description)
    expect(find('.inventory_details_desc').text).to eq(expected_description)
  end

  def validate_description_present
    expect(page).to have_selector('.inventory_details_desc')
    expect(find('.inventory_details_desc').text.length).to be > 0
  end

  def validate_price(expected_price)
    expect(find('.inventory_details_price').text).to eq(expected_price)
  end

  def validate_add_to_cart_button
    expect(page).to have_selector('#add-to-cart')
  end

  def validate_button_text(button_text)
    expect(page).to have_selector('button', text: button_text)
  end
end
