# Usar una imagen base de Java
FROM openjdk:11

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar el archivo de código fuente Java al contenedor
COPY HelloWorld.java .

# Compilar la aplicación
RUN javac HelloWorld.java

# CMD para ejecutar la aplicación cuando se inicie el contenedor
CMD ["java", "HelloWorld"]
