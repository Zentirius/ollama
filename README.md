# Ollama Python Chat

Una aplicación de chat con interfaz gráfica que integra Ollama, reconocimiento de voz y búsqueda en internet. Diseñada para ser fácil de usar y portable.

## Características

- Integración con múltiples modelos de Ollama
- Reconocimiento de voz para entrada de texto
- Búsqueda en internet integrada
- Soporte para compartir imágenes
- Guardado automático de chats
- Interfaz moderna y amigable

## Requisitos del Sistema

- Windows 10/11
- Python 3.8 o superior
- [Ollama](https://ollama.ai/download) instalado
- 16GB RAM mínimo (32GB recomendado para modelos grandes)
- Micrófono (opcional, para reconocimiento de voz)

## Instalación

1. **Instalar Ollama**
   - Descarga Ollama desde [ollama.ai/download](https://ollama.ai/download)
   - Instala siguiendo las instrucciones para Windows

2. **Descargar este repositorio**
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd Ollama-Python
   ```

3. **Crear y activar entorno virtual**
   ```bash
   python -m venv venv
   .\venv\Scripts\activate
   ```

4. **Instalar dependencias**
   ```bash
   python -m pip install --upgrade pip
   pip install -r requirements.txt
   ```

5. **Descargar un modelo de Ollama**
   ```bash
   # Elige uno de estos modelos (ordenados por tamaño):
   ollama pull deepseek-coder:6.7b    # 3.8 GB
   ollama pull codeqwen:7b            # 4.2 GB
   ollama pull codellama:13b          # 7.4 GB
   ollama pull deepseek-coder-v2:16b  # 8.9 GB
   ollama pull qwen2.5-coder:14b      # 9.0 GB
   ollama pull deepseek-coder:33b     # 18 GB
   ollama pull qwen2.5-coder:32b      # 19 GB
   ollama pull deepseek-r1:32b        # 19 GB
   ```

## Uso

1. **Iniciar la aplicación**
   ```bash
   python src/main.py
   ```

2. **Funciones principales**
   - **Chat**: Escribe tu mensaje y presiona Enter o el botón Enviar
   - **Búsqueda**: Escribe "buscar: " seguido de tu consulta
   - **Voz**: Haz clic en el botón del micrófono
   - **Imágenes**: Usa el botón de imagen para compartir archivos
   - **Modelos**: Selecciona el modelo de Ollama en el menú desplegable

## Solución de Problemas

### Errores Comunes

1. **"No se puede conectar con Ollama"**
   - Verifica que Ollama esté instalado: `ollama --version`
   - Inicia Ollama: `ollama serve`
   - Comprueba que el puerto 11434 esté disponible

2. **"Modelo no encontrado"**
   - Asegúrate de haber descargado el modelo: `ollama pull nombre-modelo`
   - Verifica los modelos instalados: `ollama list`

3. **Problemas con PyQt5**
   - Reinstala PyQt5: `pip uninstall PyQt5 && pip install PyQt5`
   - En Windows, puede requerir: `pip install pyqt5-tools`

4. **Error de reconocimiento de voz**
   - Verifica que tu micrófono esté configurado correctamente
   - Instala PyAudio: `pip install pyaudio`

### Portabilidad

Para usar la aplicación en un USB o moverla a otro PC:

1. Copia toda la carpeta del proyecto
2. Asegúrate de que Ollama esté instalado en el PC destino
3. Crea un nuevo entorno virtual en el destino
4. Instala las dependencias como se indica arriba

## Estructura de Archivos

```
Ollama-Python/
├── src/
│   ├── main.py           # Punto de entrada
│   ├── gui.py           # Interfaz gráfica
│   ├── ollama_interface.py  # Comunicación con Ollama
│   └── internet_search.py   # Búsqueda web
├── requirements.txt      # Dependencias
├── README.md            # Este archivo
└── venv/               # Entorno virtual (no incluido en git)
```

## Notas de Uso

- La aplicación creará automáticamente las carpetas necesarias para chats e imágenes
- Los chats se guardan en la carpeta `chats/`
- Las imágenes compartidas se copian a `images/`
- La aplicación intentará iniciar Ollama si no está corriendo

## Contribuir

Si encuentras algún error o tienes sugerencias:
1. Abre un issue describiendo el problema
2. Incluye los pasos para reproducir el error
3. Adjunta los logs relevantes
