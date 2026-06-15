require_relative 'base_page'

class ProductsPage < BasePage
  INVENTORY_URL = 'https://www.saucedemo.com/inventory.html'

  def visit_page
    visit INVENTORY_URL
  end

  def visit_page_unless_current
    visit_page unless current_url.include?('inventory.html')
  end

  def validate_products_list
    expect(page).to have_selector('#inventory_container > div')
  end

  def validate_product_exists(product_name)
    expect(page).to have_content(product_name)
  end

  def validate_product_price
    expect(page).to have_selector('.inventory_item_price')
  end

  def validate_add_to_cart_button
    expect(page).to have_selector("button[id^='add-to-cart']")
  end

  def validate_inventory_page(title = 'Products')
    expect(current_url).to include('/inventory.html')
    expect(page).to have_selector('.title', text: title)
  end

  def validate_complete_products_list
    expect(page).to have_selector('.inventory_list')
    expect(page.all('.inventory_item').count).to be > 0
  end

  def select_filter(filter)
    find('.product_sort_container').select(filter)
  end

  def product_names
    page.all('.inventory_item_name', minimum: 6).map(&:text)
  end

  def product_prices
    page.all('.inventory_item_price', minimum: 6).map(&:text)
  end

  def validate_product_order(expected_order)
    expect(product_names).to eq(expected_order)
  end

  def validate_price_order(expected_order)
    expect(product_prices).to eq(expected_order)
  end

  def add_product_to_cart(product_name)
    visit_page_unless_current
    find('.inventory_item', text: product_name).click_button('Add to cart')
  end

  def click_product(product_name)
    find('.inventory_item_name', text: product_name).click
  end

  def click_back_to_products
    find('button[id="back-to-products"]').click
  end

  def validate_product_button_text(product_name, button_text)
    expect(find('.inventory_item', text: product_name)).to have_selector('button', text: button_text)
  end

  def click_product_button(button_text, product_name)
    find('.inventory_item', text: product_name).click_button(button_text)
  end

  def open_sidebar
    find('#react-burger-menu-btn').click unless page.has_selector?('#logout_sidebar_link', wait: 1)
  end

  def logout
    open_sidebar
    find('#logout_sidebar_link').click
  end

  def go_to_about
    open_sidebar
    find('#about_sidebar_link').click
  end
end
