require_relative 'base_page'

class CheckoutCompletePage < BasePage
  def validate_completion
    expect(page).to have_content('Thank you for your order!')
    expect(page).to have_current_path(/.*checkout-complete\.html/)
  end
end
