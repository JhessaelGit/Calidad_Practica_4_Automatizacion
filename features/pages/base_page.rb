class BasePage
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    # Opcional: Configuración inicial
  end
end
