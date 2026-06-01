Feature: Gestión Exhaustiva del Carrito de Compras en Swag Labs
  Como un usuario autenticado de Swag Labs
  Quiero gestionar detalladamente los productos en mi carrito
  Para asegurar que los precios, cantidades y totales sean correctos antes de realizar mi pedido

  Background:
    Given que el navegador esta abierto en la pagina de inicio de Swag Labs
    And el sistema muestra el formulario de inicio de sesion
    When el usuario ingresa sus credenciales validas:
      | usuario       | contrasena   |
      | standard_user | secret_sauce |
    And hace clic en el boton de iniciar sesion
    Then el usuario es redirigido a la pagina de inventario "Products"
    And se visualiza la lista completa de productos para la venta

  # ============================================================
  # ESCENARIOS EXISTENTES
  # ============================================================

  Scenario: Verificación detallada de productos añadidos al carrito
    Given que el carrito de compras se encuentra vacio
    When agrego los siguientes productos al carrito:
      | producto                | precio   |
      | Sauce Labs Backpack     | $29.99   |
      | Sauce Labs Bike Light   | $9.99    |
    And hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto                | precio   | descripcion                                                              |
      | Sauce Labs Backpack     | $29.99   | carry.allTheThings() with the sleek, streamlined Sly Pack that melds     |
      | Sauce Labs Bike Light   | $9.99    | A red light isn't the desired state in testing but it sure helps when    |
    And deberia ver el icono del carrito con un "2"

  Scenario Outline: Gestión de eliminación de productos y actualización del contador
    Given que agrego el producto "<producto>" al carrito
    And deberia ver el icono del carrito con un "1"
    When hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    When elimino el producto "<producto>"
    Then el carrito deberia estar vacio
    And el icono del carrito no deberia mostrar ningun numero

    Examples:
      | producto                |
      | Sauce Labs Backpack     |
      | Sauce Labs Bolt T-Shirt |

  Scenario: Flujo completo de compra con validación de cálculos financieros
    Given que agrego los siguientes productos al carrito:
      | producto                |
      | Sauce Labs Backpack     |
      | Sauce Labs Bike Light   |
    And hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    When hago click en "Checkout"
    Then deberia ver el titulo de la pagina "Checkout: Your Information"
    When completo el formulario de checkout con los siguientes datos:
      | nombre | apellido  | codigo_postal |
      | Adrian | Rodriguez | 12345         |
    And hago click en "Continue"
    Then deberia ver el titulo de la pagina "Checkout: Overview"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto                | precio   |
      | Sauce Labs Backpack     | $29.99   |
      | Sauce Labs Bike Light   | $9.99    |
    And el resumen de pago deberia mostrar los siguientes valores:
      | subtotal | impuesto | total  |
      | $39.98   | $3.20    | $43.18 |
    When hago click en "Finish"
    Then deberia ver el titulo de la pagina "Checkout: Complete!"
    And deberia entrar a la pagina de confirmacion

  Scenario Outline: Validación exhaustiva de campos requeridos en el checkout
    Given que agrego el producto "Sauce Labs Backpack" al carrito
    And hago click en el icono del carrito
    And hago click en "Checkout"
    When completo el formulario de checkout con los siguientes datos:
      | nombre   | apellido   | codigo_postal   |
      | <nombre> | <apellido> | <codigo_postal> |
    And hago click en "Continue"
    Then deberia ver un mensaje de error que dice "<mensaje>"

    Examples:
      | nombre | apellido  | codigo_postal | mensaje                        |
      |        | Rodriguez | 12345         | Error: First Name is required |
      | Adrian |           | 12345         | Error: Last Name is required  |
      | Adrian | Rodriguez |               | Error: Postal Code is required |

  Scenario: Continuar comprando desde el carrito
    Given que agrego el producto "Sauce Labs Backpack" al carrito
    And hago click en el icono del carrito
    When hago click en "Continue Shopping"
    Then deberia entrar a la pagina principal y ver los productos disponibles
    And deberia ver el icono del carrito con un "1"

  # ============================================================
  # NUEVOS ESCENARIOS - EXPLORATORY TESTING
  # ============================================================

  Scenario: Agregar un producto al carrito desde la pagina de detalle del producto
    Given que el carrito de compras se encuentra vacio
    When hago click en el nombre del producto "Sauce Labs Backpack"
    Then deberia ver la pagina de detalle del producto "Sauce Labs Backpack"
    And deberia ver el precio "$29.99" en la pagina de detalle
    And deberia ver la descripcion del producto en la pagina de detalle
    When hago click en "Add to cart"
    Then deberia ver que el boton del producto cambia a "Remove"
    And deberia ver el icono del carrito con un "1"
    When hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto            | precio  |
      | Sauce Labs Backpack | $29.99  |

  Scenario: Verificar la cantidad individual de cada producto en el carrito
    Given que el carrito de compras se encuentra vacio
    When agrego los siguientes productos al carrito:
      | producto                | precio   |
      | Sauce Labs Backpack     | $29.99   |
      | Sauce Labs Bike Light   | $9.99    |
      | Sauce Labs Bolt T-Shirt | $15.99   |
    And hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver la cantidad "1" para el producto "Sauce Labs Backpack"
    And deberia ver la cantidad "1" para el producto "Sauce Labs Bike Light"
    And deberia ver la cantidad "1" para el producto "Sauce Labs Bolt T-Shirt"
    And deberia ver el icono del carrito con un "3"

  Scenario: Agregar todos los productos disponibles del inventario al carrito
    Given que el carrito de compras se encuentra vacio
    When agrego los siguientes productos al carrito:
      | producto                          | precio  |
      | Sauce Labs Backpack               | $29.99  |
      | Sauce Labs Bike Light             | $9.99   |
      | Sauce Labs Bolt T-Shirt           | $15.99  |
      | Sauce Labs Fleece Jacket          | $49.99  |
      | Sauce Labs Onesie                 | $7.99   |
      | Test.allTheThings() T-Shirt (Red) | $15.99  |
    Then deberia ver el icono del carrito con un "6"
    When hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver "6" productos listados en el carrito

  Scenario: Eliminar un producto desde la pagina de inventario usando el boton Remove
    Given que agrego el producto "Sauce Labs Backpack" al carrito
    Then deberia ver el icono del carrito con un "1"
    And el boton del producto "Sauce Labs Backpack" en inventario deberia decir "Remove"
    When hago click en "Remove" para el producto "Sauce Labs Backpack" en inventario
    Then el icono del carrito no deberia mostrar ningun numero
    And el boton del producto "Sauce Labs Backpack" en inventario deberia decir "Add to cart"

  Scenario: Cancelar el proceso de checkout y regresar al carrito
    Given que agrego el producto "Sauce Labs Backpack" al carrito
    And hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    When hago click en "Checkout"
    Then deberia ver el titulo de la pagina "Checkout: Your Information"
    When hago click en "Cancel"
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto            | precio  |
      | Sauce Labs Backpack | $29.99  |

  Scenario: Volver al inicio despues de completar una compra exitosa
    Given que agrego el producto "Sauce Labs Onesie" al carrito
    And hago click en el icono del carrito
    And hago click en "Checkout"
    When completo el formulario de checkout con los siguientes datos:
      | nombre | apellido  | codigo_postal |
      | Adrian | Rodriguez | 12345         |
    And hago click en "Continue"
    Then deberia ver el titulo de la pagina "Checkout: Overview"
    When hago click en "Finish"
    Then deberia ver el titulo de la pagina "Checkout: Complete!"
    And deberia entrar a la pagina de confirmacion
    When hago click en "Back Home"
    Then deberia ver el titulo de la pagina "Products"
    And el icono del carrito no deberia mostrar ningun numero

  Scenario: Persistencia del carrito al navegar entre paginas del sitio
    Given que el carrito de compras se encuentra vacio
    When que agrego el producto "Sauce Labs Backpack" al carrito
    Then deberia ver el icono del carrito con un "1"
    When hago click en el nombre del producto "Sauce Labs Bike Light"
    Then deberia ver la pagina de detalle del producto "Sauce Labs Bike Light"
    And deberia ver el icono del carrito con un "1"
    When hago click en el boton de volver a productos
    Then deberia ver el titulo de la pagina "Products"
    And deberia ver el icono del carrito con un "1"
    When hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto            | precio  |
      | Sauce Labs Backpack | $29.99  |

  Scenario: Flujo de compra con un solo producto y validacion financiera minima
    Given que agrego el producto "Sauce Labs Onesie" al carrito
    And hago click en el icono del carrito
    Then deberia ver el titulo de la pagina "Your Cart"
    And deberia ver la cantidad "1" para el producto "Sauce Labs Onesie"
    When hago click en "Checkout"
    Then deberia ver el titulo de la pagina "Checkout: Your Information"
    When completo el formulario de checkout con los siguientes datos:
      | nombre | apellido  | codigo_postal |
      | Adrian | Rodriguez | 12345         |
    And hago click en "Continue"
    Then deberia ver el titulo de la pagina "Checkout: Overview"
    And deberia ver los siguientes productos con sus detalles en el carrito:
      | producto          | precio |
      | Sauce Labs Onesie | $7.99  |
    And el resumen de pago deberia mostrar los siguientes valores:
      | subtotal | impuesto | total |
      | $7.99    | $0.64    | $8.63 |
    When hago click en "Finish"
    Then deberia ver el titulo de la pagina "Checkout: Complete!"
    And deberia entrar a la pagina de confirmacion