@echo off
echo Iniciando la aplicacion Ollama Python...

REM Crear y activar entorno virtual si no existe
if not exist "venv" (
    python -m venv venv
)
call venv\Scripts\activate

REM Actualizar pip sin intentar una instalación global
python -m pip install --upgrade pip --user

REM Instalar dependencias en el entorno virtual
python -m pip install -r requirements.txt

echo Iniciando la aplicacion...
echo Esta aplicacion abrira una ventana nueva (no en el navegador)
echo Si no ves una ventana nueva, puede haber un error.
echo.

REM Ejecutar la aplicación
python src/main.py

if errorlevel 1 (
    echo.
    echo *** ERROR: La aplicacion no pudo iniciarse ***
    echo Por favor, envia una captura de pantalla de cualquier mensaje de error anterior.
    echo.
    pause
) else (
    echo Aplicacion cerrada correctamente.
)
