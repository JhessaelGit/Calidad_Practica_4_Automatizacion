# Automatizacion de pruebas - Swag Labs

Proyecto de automatizacion de pruebas funcionales para la aplicacion web **Swag Labs** usando Ruby, Cucumber, Capybara y Selenium WebDriver.

## AUT

La AUT (Application Under Test) es **Swag Labs**, una tienda web de demostracion disponible en:

```text
https://www.saucedemo.com
```

El sistema permite iniciar sesion, visualizar productos, ordenar el inventario, consultar el detalle de un producto, agregar productos al carrito y completar un flujo de checkout.

## Objetivo del proyecto

Automatizar escenarios funcionales representativos de Swag Labs para validar que los flujos principales del usuario sigan funcionando correctamente.

Los escenarios cubren:

- Login y logout.
- Redireccion al sitio About.
- Visualizacion de productos.
- Ordenamiento por filtros.
- Detalle de producto.
- Agregado de productos al carrito.
- Eliminacion de productos del carrito.
- Validaciones del checkout.
- Flujo completo de compra.

## Tecnologias usadas

- Ruby.
- Cucumber.
- Capybara.
- Selenium WebDriver.
- RSpec Expectations.
- Google Chrome / ChromeDriver.

## Estructura del proyecto

```text
features/
  *.feature
    Escenarios escritos en Gherkin.

  pages/
    Page Objects usados para encapsular selectores, acciones y validaciones.

  step_definitions/
    Definiciones de pasos de Cucumber.

  support/
    Configuracion de Capybara, Selenium, hooks y carga de Page Objects.
```

Page Objects principales:

```text
features/pages/base_page.rb
features/pages/login_page.rb
features/pages/products_page.rb
features/pages/cart_page.rb
features/pages/checkout_page.rb
features/pages/product_detail_page.rb
features/pages/common_page.rb
```

## Page Object Model

El proyecto aplica el patron **Page Object Model (POM)** para separar la logica tecnica de automatizacion de los pasos escritos en Cucumber.

Responsabilidades:

- Los archivos `features/*.feature` describen el comportamiento esperado desde la perspectiva del usuario.
- Los archivos `features/step_definitions/*_steps.rb` conectan los pasos Gherkin con acciones de alto nivel.
- Los archivos `features/pages/*_page.rb` contienen selectores, acciones de UI y validaciones especificas de cada pagina.

Ejemplo:

```ruby
products_page.add_product_to_cart('Sauce Labs Backpack')
cart_page.validate_badge('1')
checkout_page.fill_information(data)
```

Esto evita que los steps dependan directamente de selectores CSS como `#first-name`, `.cart_item` o `.inventory_item_name`.

## Requisitos

Tener instalado:

- Ruby.
- Google Chrome.
- ChromeDriver compatible con la version de Chrome.
- Gems necesarias para ejecutar Cucumber, Capybara y Selenium.

Instalacion sugerida de gems:

```powershell
gem install cucumber
gem install capybara
gem install selenium-webdriver
gem install rspec-expectations
gem install webdrivers
```

Si Chrome o ChromeDriver estan en una ruta diferente, se pueden configurar variables de entorno:

```powershell
$env:CHROME_BINARY_PATH = "C:/Program Files/Google/Chrome/Application/chrome.exe"
$env:CHROMEDRIVER_PATH = "C:/ruta/al/chromedriver.exe"
```

## Configuracion del navegador

La configuracion principal esta en:

```text
features/support/env.rb
```

El driver configurado es `selenium_chrome_stable`.

Tambien se desactivan avisos del administrador de contrasenas de Chrome para evitar popups durante la ejecucion automatizada:

```ruby
options.add_argument('--password-store=basic')
options.add_argument('--disable-features=PasswordManagerOnboarding')
options.add_argument('--disable-features=AutofillServerCommunication')
options.add_preference('credentials_enable_service', false)
options.add_preference('profile.password_manager_enabled', false)
options.add_preference('profile.password_manager_leak_detection', false)
```

## Como ejecutar las pruebas

Ejecutar toda la suite:

```powershell
cucumber
```

Ejecutar una feature especifica:

```powershell
cucumber features/Cart.feature
```

Ejecutar un escenario por linea:

```powershell
cucumber features/Cart.feature:20
```

Ejecutar sin publicar reporte en Cucumber Reports:

```powershell
cucumber --publish-quiet
```

## Reporte local de ejecucion

Para generar un reporte HTML local:

```powershell
cucumber --format html --out reports/cucumber_report.html --publish-quiet
```

El archivo generado se encontrara en:

```text
reports/cucumber_report.html
```

## Smoke Test

El Smoke Test debe contener los escenarios minimos que validan que la aplicacion esta estable para continuar con pruebas mas amplias.

La justificacion completa de criterios y escenarios seleccionados esta en:

```text
SMOKE_TEST.md
```

Criterios tecnicos para elegir los casos del Smoke Test:

- **Criticidad:** flujos de negocio importantes o de alto riesgo.
- **Repetitividad:** casos que se ejecutan constantemente.
- **Tedioso manualmente:** casos que requieren varios pasos repetitivos.
- **Tiempo manual:** casos que consumen tiempo si se verifican manualmente.

Escenarios incluidos en el Smoke Test:

- Iniciar sesion y cerrar sesion correctamente.
- Verificar lista de productos disponibles.
- Verificacion detallada de productos agregados al carrito.
- Flujo completo de compra exitosa.

Los escenarios estan etiquetados con `@smoke` y se ejecutan con:

```powershell
cucumber --tags "@smoke" --publish-quiet
```

Para generar el reporte HTML del Smoke Test:

```powershell
cucumber --tags "@smoke" --format html --out reports/smoke_report.html --publish-quiet
```

## Hooks

Los hooks se encuentran en:

```text
features/support/hooks.rb
```

Actualmente se utilizan para:

- Mostrar en consola el nombre del escenario en ejecucion.
- Maximizar la ventana en escenarios marcados con `@maximize`.
- Tomar captura de pantalla cuando falla un escenario.
- Guardar capturas en `reports/screenshots`.
- Adjuntar la captura al reporte de Cucumber cuando el formato de salida lo permite.
- Cerrar la sesion del navegador al finalizar cada escenario.

Todas las features estan marcadas con `@maximize`, por lo que el hook de maximizar ventana se ejecuta durante la suite.

## Buenas practicas aplicadas

- Separacion de responsabilidades con Page Object Model.
- Steps de Cucumber orientados al negocio.
- Selectores encapsulados en Page Objects.
- Configuracion centralizada de Capybara y Selenium.
- Uso de `Background` para precondiciones compartidas.
- Uso de `Scenario Outline` para probar variaciones con ejemplos.

## Mejoras pendientes sugeridas

- Generar y adjuntar reporte HTML de ejecucion.
