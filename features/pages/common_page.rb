require_relative 'base_page'

class CommonPage < BasePage
  def click_button_link_or_input(text)
    if page.has_selector?('button', text: text, wait: 2)
      find('button', text: text).click
    elsif page.has_selector?("input[value='#{text}']", wait: 2)
      find("input[value='#{text}']").click
    else
      click_link_or_button text
    end
  end

  def validate_title(title)
    expect(page).to have_selector('.title', text: title)
  end
end
