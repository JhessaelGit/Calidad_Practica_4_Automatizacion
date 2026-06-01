Feature: Redireccion About en Swag Labs

  Background: Usuario autenticado en la pagina principal
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    Then deberia entrar a la pagina principal

  Scenario: SA-6 Probar que el boton About redirige a la pagina de Sauce Labs
    When abro el menu lateral
    And hago click en About
    Then deberia redirigirme a la pagina de Sauce Labs
