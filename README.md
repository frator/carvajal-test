# Carvajal Test App
## Descripción del proyecto

Esta aplicación permite consultar el valor actual de al menos tres acciones del mercado financiero (ej. AAPL, MSFT, GOOGL) usando una API pública (Alpha Vantage). El frontend y backend están integrados en un mismo contenedor Docker, accesible desde el navegador.

### Requisitos:
- Docker
- Cuenta en [Alpha Vantage](https://www.alphavantage.co/support/#api-key)

### Despliegue:
1. Agrega tu API key en `app/.env`
2. Ejecuta `build-push.sh`
3. Ejecuta `run-carvajal.sh`
4. Abre [http://localhost:80](http://localhost:80)

## Configuración

1. Clona este repositorio:

```bash
git clone https://github.com/frator/carvajal-test.git
cd carvajal-test
