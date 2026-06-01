Feature: Agregar producto al carrito desde detalle

  Scenario: Agregar Sauce Labs Backpack al carrito desde la pagina de detalle
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    Then deberia entrar a la pagina principal

    When hago click en el producto Sauce Labs Backpack
    And hago click en Add to cart desde detalle
    And ingreso al carrito
    Then deberia ver el producto "Sauce Labs Backpack" en el carrito
    And deberia ver la descripcion del producto en el carrito "carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection."
    And deberia ver el precio "$29.99" en el carrito