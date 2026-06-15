Feature: Agregar producto al carrito desde detalle
  Como usuario autenticado
  Quiero agregar un producto desde su pagina de detalle
  Para confirmar que se muestra correctamente en el carrito

  Scenario: Agregar Sauce Labs Backpack al carrito desde la pagina de detalle
    Given que el usuario esta autenticado en la pagina de inventario
    When hago click en el producto Sauce Labs Backpack
    And hago click en Add to cart desde detalle
    And ingreso al carrito
    Then deberia ver el producto "Sauce Labs Backpack" en el carrito
    And deberia ver la descripcion del producto en el carrito "carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection."
    And deberia ver el precio "$29.99" en el carrito
