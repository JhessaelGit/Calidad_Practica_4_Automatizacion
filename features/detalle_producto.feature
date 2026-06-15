Feature: Detalle de producto en Swag Labs
  Como usuario autenticado
  Quiero consultar la pagina de detalle de un producto
  Para verificar su informacion principal antes de comprarlo

  Background: Usuario autenticado en inventario
    Given que existe una sesion activa de usuario estandar
    And el usuario se encuentra en la pagina de inventario

  Scenario: Verificar datos exactos del producto Sauce Labs Backpack
    When hago click en el producto Sauce Labs Backpack
    Then el nombre del producto deberia ser "Sauce Labs Backpack"
    And la descripcion del producto deberia ser "carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection."
    And el precio del producto deberia ser "$29.99"
    And deberia existir el boton Add to cart en detalle
