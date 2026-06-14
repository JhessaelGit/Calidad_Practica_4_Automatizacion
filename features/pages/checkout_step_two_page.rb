require_relative 'base_page'

class CheckoutStepTwoPage < BasePage
  def validate_summary(subtotal, tax, total)
    expect(page).to have_content("Item total: #{subtotal}") if subtotal
    expect(page).to have_content("Tax: #{tax}") if tax
    expect(page).to have_content("Total: #{total}") if total
  end

  def finish
    find('#finish').click
  end
end
