@echo off
echo Iniciando la aplicacion Ollama Python...

REM Verificar Python
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python no esta instalado
    echo Por favor, instala Python desde https://www.python.org/downloads/
    echo Asegurate de marcar "Add Python to PATH" durante la instalacion
    pause
    exit /b 1
)

REM Crear entorno virtual si no existe
if not exist venv (
    echo Creando entorno virtual...
    python -m venv venv
    if errorlevel 1 (
        echo Error al crear el entorno virtual
        pause
        exit /b 1
    )
)

REM Activar entorno virtual
call venv\Scripts\activate
if errorlevel 1 (
    echo Error al activar el entorno virtual
    pause
    exit /b 1
)

REM Actualizar pip
python -m pip install --upgrade pip

REM Limpiar instalaciones previas de PyQt5
echo Limpiando instalaciones previas...
pip uninstall -y PyQt5 PyQt5-Qt5 PyQt5-sip PyQt5-tools

REM Instalar PyQt5 específicamente
echo Instalando PyQt5...
pip install PyQt5==5.15.9
if errorlevel 1 (
    echo Error al instalar PyQt5
    pause
    exit /b 1
)

REM Instalar otras dependencias
echo Instalando otras dependencias...
pip install -r requirements.txt
if errorlevel 1 (
    echo Error al instalar dependencias
    pause
    exit /b 1
)

REM Verificar Ollama
echo.
echo Verificando Ollama...
ollama --version >nul 2>&1
if errorlevel 1 (
    echo ADVERTENCIA: Ollama no esta instalado o no esta en el PATH
    echo Por favor:
    echo 1. Descarga Ollama desde https://ollama.ai/download
    echo 2. Instala Ollama
    echo 3. Agrega Ollama al PATH del sistema
    echo 4. Reinicia tu computadora
    echo.
    choice /C YN /M "¿Deseas continuar de todos modos?"
    if errorlevel 2 exit /b 1
)

REM Crear archivo .env si no existe
if not exist .env (
    echo Creando archivo .env...
    echo OLLAMA_HOST=http://localhost:11434> .env
    echo OLLAMA_PATH=ollama>> .env
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
