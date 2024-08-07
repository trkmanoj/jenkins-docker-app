FROM openjdk:8-jdk
EXPOSE 8080
COPY target/jenkins-docker-app-0.0.1-SNAPSHOT.jar jenkins-docker-app-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/jenkins-docker-app-0.0.1-SNAPSHOT.jar"]