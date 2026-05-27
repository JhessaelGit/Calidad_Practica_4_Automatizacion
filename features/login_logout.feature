Feature: Login y Logout en Swag Labs

  Scenario: Iniciar sesion y cerrar sesion correctamente
    Given que estoy en la pagina de login
    When ingreso el username "standard_user"
    And ingreso el password "secret_sauce"
    And hago click en Login
    Then deberia entrar a la pagina principal
    When abro el menu lateral
    And hago click en Logout
    Then deberia volver al login