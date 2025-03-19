FROM maven:3.8.4-openjdk-21-slim AS build
WORKDIR /demo
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
VOLUME /tmp
COPY --from=build /demo/target/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]