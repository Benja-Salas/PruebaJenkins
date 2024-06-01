# Usar una imagen base de Java
FROM openjdk:11

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar el archivo de código fuente Java al contenedor
COPY Helloworld.java .

# Compilar la aplicación
RUN javac Helloworld.java

# CMD para ejecutar la aplicación cuando se inicie el contenedor
CMD ["java", "Helloworld"]
