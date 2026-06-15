Feature: Redireccion About en Swag Labs
  Como usuario autenticado
  Quiero abrir la opcion About del menu lateral
  Para verificar que el sistema redirige al sitio de Sauce Labs

  Scenario: SA-6 Probar que el boton About redirige a la pagina de Sauce Labs
    Given que el usuario esta autenticado en la pagina de inventario
    When abro el menu lateral
    And hago click en About
    Then deberia redirigirme a la pagina de Sauce Labs
