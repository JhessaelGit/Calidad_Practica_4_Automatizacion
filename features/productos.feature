@maximize
Feature: Verificacion de productos en Swag Labs
  Como usuario autenticado
  Quiero visualizar el inventario de productos
  Para confirmar que la tienda muestra productos disponibles para compra

  Background: Usuario autenticado en inventario
    Given que existe una sesion activa de usuario estandar
    And el usuario se encuentra en la pagina de inventario

  @smoke
  Scenario: Verificar lista de productos disponibles
    Then deberia existir la lista de productos
    And deberia existir el producto "Sauce Labs Backpack"
    And deberia existir el precio del producto
    And deberia existir el boton Add to cart
