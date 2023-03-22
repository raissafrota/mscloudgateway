#FROM maven:3.8.5-openjdk-11 as build
#WORKDIR /app
#COPY . .
#RUN mvn clean package -DskipTests

#FROM openjdk:11
#WORKDIR /app
#COPY --from=build ./app/target/*.jar ./app.jar

#ARG EUREKA_SERVER=localhost
#ARG KEYCLOAK_SERVER=localhost
#ARG KEYCLOAK_PORT=8081

#ENTRYPOINT java -jar -Dspring.profiles.active=prod app.jar
#################################
FROM openjdk:11
WORKDIR /app
COPY ./target/mscloudgateway-0.0.1-SNAPSHOT.jar app.jar

ARG EUREKA_SERVER=localhost
ARG KEYCLOAK_SERVER=localhost
ARG KEYCLOAK_PORT=8081

ENTRYPOINT java -jar -Dspring.profiles.active=prod app.jar