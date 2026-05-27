Feature: Verificacion de productos en Swag Labs

  Scenario: Login y verificacion de lista de productos
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    Then deberia entrar a la pagina principal
    And deberia existir la lista de productos
    And deberia existir el producto "Sauce Labs Backpack"
    And deberia existir el precio del producto
    And deberia existir el boton Add to cart