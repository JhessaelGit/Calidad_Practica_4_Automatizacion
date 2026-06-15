Feature: Login y Logout en Swag Labs
  Como usuario de Swag Labs
  Quiero iniciar y cerrar sesion
  Para validar el acceso seguro a la aplicacion

  @smoke
  Scenario: Iniciar sesion y cerrar sesion correctamente
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    And abro el menu lateral
    And hago click en Logout
    Then deberia volver al login
