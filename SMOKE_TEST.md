# Smoke Test

El Smoke Test valida los flujos minimos que deben funcionar antes de ejecutar pruebas mas amplias. Si alguno de estos escenarios falla, no conviene continuar con pruebas de detalle porque la aplicacion presenta problemas en funcionalidades base.

## Criterios de seleccion

Los escenarios marcados con `@smoke` fueron seleccionados con estos criterios tecnicos:

| Criterio | Aplicacion en el proyecto |
| --- | --- |
| Criticidad | Cubren acceso, visualizacion de productos, carrito y compra, que son flujos principales de Swag Labs. |
| Repetitividad | Son casos que se deben ejecutar en cada ciclo de validacion. |
| Tedioso manualmente | Requieren varios pasos repetitivos si se prueban a mano. |
| Tiempo manual | Automatizarlos reduce el tiempo de verificacion inicial antes de pruebas mas detalladas. |

## Escenarios incluidos

| Feature | Escenario | Motivo |
| --- | --- | --- |
| `features/login_logout.feature` | Iniciar sesion y cerrar sesion correctamente | Verifica acceso correcto y cierre de sesion. |
| `features/productos.feature` | Verificar lista de productos disponibles | Confirma que el inventario principal carga correctamente. |
| `features/Cart.feature` | Verificacion detallada de productos agregados al carrito | Valida que se puedan agregar productos y verlos en carrito. |
| `features/Cart.feature` | Flujo completo de compra exitosa | Cubre el flujo critico desde carrito hasta confirmacion de compra. |

## Ejecucion

Ejecutar solamente el Smoke Test:

```powershell
cucumber --tags "@smoke" --publish-quiet
```

Generar reporte HTML del Smoke Test:

```powershell
cucumber --tags "@smoke" --format html --out reports/smoke_report.html --publish-quiet
```

El reporte generado queda en:

```text
reports/smoke_report.html
```
