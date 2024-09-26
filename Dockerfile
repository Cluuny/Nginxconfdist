FROM maven:3.8.8-eclipse-temurin-17 AS build

WORKDIR /app

RUN git clone https://github.com/Cluuny/animals_rest.git .

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

VOLUME /app/data
