FROM openjdk:8-jre-alpine

EXPOSE 8080

# Pastikan untuk menyertakan nama file .jar yang benar
COPY ./target/java-maven-app-1.1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

CMD java -jar java-maven-app-1.1.0-SNAPSHOT.jar
