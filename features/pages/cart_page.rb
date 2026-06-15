require_relative 'base_page'

class CartPage < BasePage
  CART_URL = 'https://www.saucedemo.com/cart.html'

  def visit_page
    visit CART_URL
  end

  def open
    find('.shopping_cart_link', wait: 5).click
  end

  def clear
    visit_page

    if page.has_selector?('.cart_item', wait: 2)
      page.all('.cart_item').each do |item|
        item.click_button('Remove')
      end
    end
  end

  def remove_product(product_name)
    find('.cart_item', text: product_name).click_button('Remove')
  end

  def validate_empty
    expect(page).to have_no_selector('.cart_item')
  end

  def validate_badge(number)
    expect(page).to have_selector('.shopping_cart_badge', text: number)
  end

  def validate_badge_empty
    expect(page).to have_no_selector('.shopping_cart_badge')
  end

  def validate_product(product_name)
    expect(find('#item_4_title_link > div').text).to eq(product_name)
  end

  def validate_product_description(description)
    expect(find('.cart_item .inventory_item_desc').text).to eq(description)
  end

  def validate_product_price(price)
    expect(find('.cart_item .item_pricebar .inventory_item_price').text).to eq(price)
  end

  def validate_products_details(rows)
    visit_page unless current_url.include?('cart.html') || current_url.include?('checkout-step-two.html')

    rows.each do |row|
      cart_item = find('.cart_item', text: row['producto'])
      expect(cart_item).to have_content(row['precio'])
      expect(cart_item.text).to include(row['descripcion']) if row['descripcion']
    end
  end

  def validate_product_quantity(product_name, quantity)
    cart_item = find('.cart_item', text: product_name)
    expect(cart_item.find('.cart_quantity')).to have_content(quantity)
  end

  def validate_items_count(count)
    expect(page.all('.cart_item').count).to eq(count.to_i)
  end

  def validate_cart_page
    expect(page).to have_current_path(/.*cart\.html/, url: true)
  end
end
