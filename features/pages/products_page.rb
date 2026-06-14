require_relative 'base_page'

class ProductsPage < BasePage
  def validate_products_list
    expect(page).to have_selector('#inventory_container > div')
  end

  def validate_product_exists(product_name)
    # Nota: El selector original era #item_4_title_link, lo cual es muy específico.
    # Un enfoque POM mejor sería buscar por texto.
    expect(page).to have_content(product_name)
  end

  def validate_product_price
    expect(page).to have_selector('.inventory_item_price')
  end

  def validate_add_to_cart_button
    expect(page).to have_selector("button[id^='add-to-cart']")
  end

  def add_product_to_cart(product_name)
    within(".inventory_item", text: product_name) do
      click_button 'Add to cart'
    end
  end

  def remove_product_from_cart(product_name)
    within(".inventory_item", text: product_name) do
      click_button 'Remove'
    end
  end

  def check_product_button_text(product_name, text)
    within(".inventory_item", text: product_name) do
      expect(page).to have_button(text)
    end
  end

  # Menú Lateral (Sidebar)
  def open_sidebar
    find('#react-burger-menu-btn').click
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
