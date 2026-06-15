# Page Object Model

El proyecto usa **Page Object Model (POM)** para separar los escenarios de negocio de la automatizacion tecnica con Capybara.

## Objetivo

Evitar que los step definitions dependan directamente de selectores CSS, rutas, botones o detalles internos de la interfaz.

Con esta separacion:

- Los escenarios Gherkin describen comportamiento esperado.
- Los step definitions expresan acciones de alto nivel.
- Los page objects encapsulan selectores, acciones y validaciones de UI.

## Estructura aplicada

```text
features/
  pages/
    base_page.rb
    login_page.rb
    products_page.rb
    cart_page.rb
    checkout_page.rb
    product_detail_page.rb
    common_page.rb

  step_definitions/
    *_steps.rb
```

## Responsabilidades por Page Object

| Page Object | Responsabilidad |
| --- | --- |
| `BasePage` | Incluye DSL de Capybara y matchers de RSpec para las paginas. |
| `LoginPage` | Acceso a Swag Labs, ingreso de credenciales y validacion de login. |
| `ProductsPage` | Inventario, filtros, seleccion de productos, botones de producto y menu lateral. |
| `CartPage` | Navegacion al carrito, limpieza, validacion de productos, cantidades y contador. |
| `CheckoutPage` | Formulario de checkout, errores, resumen y confirmacion de compra. |
| `ProductDetailPage` | Validaciones y acciones en la pagina de detalle de producto. |
| `CommonPage` | Acciones compartidas como hacer click por texto y validar titulos. |

## Ejemplo de uso en steps

Los steps delegan a page objects:

```ruby
When('agrego el producto {string} al carrito') do |product_name|
  products_page.add_product_to_cart(product_name)
end

Then('deberia ver el icono del carrito con un {string}') do |number|
  cart_page.validate_badge(number)
end
```

La logica tecnica queda dentro del page object:

```ruby
def add_product_to_cart(product_name)
  visit_page_unless_current
  find('.inventory_item', text: product_name).click_button('Add to cart')
end
```

## Evidencia de aplicacion

Los step definitions no contienen selectores ni llamadas directas principales de Capybara como:

```text
find
visit
within
click_button
page.all
current_url
sleep
```

Estas llamadas estan concentradas en:

```text
features/pages
features/support
```

`features/support` contiene hooks y configuracion transversal, por lo que es correcto que use Capybara para tareas como maximizar ventana, tomar screenshots y cerrar el navegador.

## Reglas de mantenimiento

- Si cambia un selector de la AUT, modificar el Page Object correspondiente, no el step.
- Si aparece una nueva pagina o flujo importante, crear un Page Object nuevo.
- Si una accion se comparte entre varias paginas, moverla a `CommonPage`.
- No agregar `sleep`; usar esperas implicitas de Capybara mediante selectores y matchers.
- Mantener los steps orientados al lenguaje del usuario.
