Feature: Filtros de productos en Swag Labs
  Como usuario autenticado
  Quiero ordenar los productos del inventario
  Para revisar que la lista respeta el filtro seleccionado

  Background: Usuario autenticado en inventario
    Given que existe una sesion activa de usuario estandar
    And el usuario se encuentra en la pagina de inventario

  Scenario Outline: Verificar ordenamiento de productos por filtro
    When selecciono el filtro "<filtro>"
    Then los productos deberian aparecer en este orden "<orden_productos>"
    And los precios deberian aparecer en este orden "<orden_precios>"

    Examples:
      | filtro              | orden_productos                                                                                                                              | orden_precios                              |
      | Name (A to Z)       | Sauce Labs Backpack,Sauce Labs Bike Light,Sauce Labs Bolt T-Shirt,Sauce Labs Fleece Jacket,Sauce Labs Onesie,Test.allTheThings() T-Shirt (Red) | $29.99,$9.99,$15.99,$49.99,$7.99,$15.99   |
      | Name (Z to A)       | Test.allTheThings() T-Shirt (Red),Sauce Labs Onesie,Sauce Labs Fleece Jacket,Sauce Labs Bolt T-Shirt,Sauce Labs Bike Light,Sauce Labs Backpack | $15.99,$7.99,$49.99,$15.99,$9.99,$29.99   |
      | Price (low to high) | Sauce Labs Onesie,Sauce Labs Bike Light,Sauce Labs Bolt T-Shirt,Test.allTheThings() T-Shirt (Red),Sauce Labs Backpack,Sauce Labs Fleece Jacket | $7.99,$9.99,$15.99,$15.99,$29.99,$49.99   |
      | Price (high to low) | Sauce Labs Fleece Jacket,Sauce Labs Backpack,Sauce Labs Bolt T-Shirt,Test.allTheThings() T-Shirt (Red),Sauce Labs Bike Light,Sauce Labs Onesie | $49.99,$29.99,$15.99,$15.99,$9.99,$7.99   |
