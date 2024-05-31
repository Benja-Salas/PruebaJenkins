# Usa una imagen base de Python
FROM python:3.8-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto en el contenedor
COPY . .

# Instala las dependencias necesarias
RUN pip install unittest

# Comando para ejecutar las pruebas
CMD ["python", "-m", "unittest", "discover"]
