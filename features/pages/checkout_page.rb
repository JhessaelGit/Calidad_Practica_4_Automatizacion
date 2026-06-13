require_relative 'base_page'

class CheckoutPage < BasePage
  def fill_information(data)
    fill_first_name(data['nombre'])
    fill_last_name(data['apellido'])
    fill_postal_code(data['codigo_postal'])
  end

  def fill_first_name(name)
    find('#first-name').set(name) if present?(name)
  end

  def fill_last_name(last_name)
    find('#last-name').set(last_name) if present?(last_name)
  end

  def fill_postal_code(postal_code)
    find('#postal-code').set(postal_code) if present?(postal_code)
  end

  def validate_payment_summary(data)
    expect(page).to have_content("Item total: #{data['subtotal']}") if data['subtotal']
    expect(page).to have_content("Tax: #{data['impuesto']}") if data['impuesto']
    expect(page).to have_content("Total: #{data['total']}") if data['total']
  end

  def validate_confirmation_page
    expect(page).to have_current_path(/.*checkout-complete\.html/, url: true)
    expect(page).to have_content('Thank you for your order!')
  end

  def validate_information_page
    expect(page).to have_current_path(/.*checkout-step-one\.html/, url: true)
    expect(page).to have_selector('#first-name')
  end

  def validate_overview_page
    expect(page).to have_current_path(/.*checkout-step-two\.html/, url: true)
    expect(page).to have_content('Checkout: Overview')
  end

  def validate_error_message(message)
    expect(page).to have_selector('[data-test="error"]', text: message)
  end

  private

  def present?(value)
    value && !value.empty?
  end
end
