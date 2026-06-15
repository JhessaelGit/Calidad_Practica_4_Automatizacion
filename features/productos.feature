Feature: Verificacion de productos en Swag Labs
  Como usuario autenticado
  Quiero visualizar el inventario de productos
  Para confirmar que la tienda muestra productos disponibles para compra

  Scenario: Verificar lista de productos disponibles
    Given que el usuario esta autenticado en la pagina de inventario
    Then deberia existir la lista de productos
    And deberia existir el producto "Sauce Labs Backpack"
    And deberia existir el precio del producto
    And deberia existir el boton Add to cart
