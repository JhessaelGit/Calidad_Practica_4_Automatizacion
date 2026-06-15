Feature: Redireccion About en Swag Labs
  Como usuario autenticado
  Quiero abrir la opcion About del menu lateral
  Para verificar que el sistema redirige al sitio de Sauce Labs

  Background: Usuario autenticado en inventario
    Given que existe una sesion activa de usuario estandar
    And el usuario se encuentra en la pagina de inventario

  Scenario: SA-6 Probar que el boton About redirige a la pagina de Sauce Labs
    When abro el menu lateral
    And hago click en About
    Then deberia redirigirme a la pagina de Sauce Labs
