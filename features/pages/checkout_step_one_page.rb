require_relative 'base_page'

class CheckoutStepOnePage < BasePage
  def fill_information(first_name, last_name, zip)
    find('#first-name').set(first_name) if first_name
    find('#last-name').set(last_name) if last_name
    find('#postal-code').set(zip) if zip
  end

  def continue
    find('#continue').click
  end
end
