require_relative 'base_page'

class ProductDetailPage < BasePage
  def validate_product_info(name, price)
    expect(page).to have_css('.inventory_details_name', text: name) if name
    expect(page).to have_css('.inventory_details_price', text: price) if price
  end

  def add_to_cart
    find("button[id^='add-to-cart']").click
  end

  def back_to_products
    find('#back-to-products').click
  end
end
