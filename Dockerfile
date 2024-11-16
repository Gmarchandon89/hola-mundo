# Usa una imagen base de OpenJDK
FROM openjdk:11-jre-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR al contenedor
COPY target/hola-mundo-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto 8083
EXPOSE 8083

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
