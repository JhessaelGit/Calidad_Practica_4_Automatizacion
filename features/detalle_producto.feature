Feature: Detalle de producto en Swag Labs

  Scenario: Verificar datos exactos del producto Sauce Labs Backpack
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    Then deberia entrar a la pagina principal

    When hago click en el producto Sauce Labs Backpack
    Then el nombre del producto deberia ser "Sauce Labs Backpack"
    And la descripcion del producto deberia ser "carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection."
    And el precio del producto deberia ser "$29.99"
    And deberia existir el boton Add to cart en detalle