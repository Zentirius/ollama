@echo off
echo Iniciando la aplicacion Ollama Python...

REM Limpiar instalaciones previas de PyQt5
pip uninstall -y PyQt5 PyQt5-Qt5 PyQt5-sip

REM Actualizar pip
python -m pip install --upgrade pip

REM Crear entorno virtual si no existe
if not exist venv (
    echo Creando entorno virtual...
    python -m venv venv
)

REM Activar entorno virtual
call venv\Scripts\activate

REM Instalar PyQt5 específicamente primero
pip install PyQt5==5.15.9

REM Instalar el resto de dependencias
echo Instalando dependencias...
pip install -r requirements.txt

REM Verificar Ollama
echo.
echo Verificando Ollama...
ollama --version
if errorlevel 1 (
    echo ADVERTENCIA: Ollama no esta instalado o no esta en el PATH
    echo Por favor, instala Ollama desde https://ollama.ai/download
    echo y asegurate de que este en el PATH del sistema
    echo.
    pause
    exit /b 1
)

REM Iniciar la aplicacion
echo.
echo Iniciando la aplicacion...
echo Esta aplicacion abrira una ventana nueva
echo Si no ves una ventana nueva, espera unos segundos...
echo.

python src/main.py

if errorlevel 1 (
    echo.
    echo *** ERROR: La aplicacion no pudo iniciarse ***
    echo Ejecutando diagnostico...
    echo.
    
    python -c "import PyQt5.QtWidgets" 2>nul
    if errorlevel 1 (
        echo Error: PyQt5 no esta instalado correctamente
        echo Intentando reinstalar PyQt5...
        pip uninstall -y PyQt5 PyQt5-Qt5 PyQt5-sip
        pip install PyQt5==5.15.9
    ) else (
        echo PyQt5 esta instalado correctamente
    )
    
    echo.
    echo Por favor, verifica:
    echo 1. Que Ollama este instalado y en el PATH
    echo 2. Que el archivo .env tenga la configuracion correcta
    echo 3. Que tengas suficiente memoria RAM disponible
    echo.
    echo Para mas ayuda, consulta el README.md
)

pause
