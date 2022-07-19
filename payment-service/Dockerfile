FROM tomcat:jre8-openjdk-slim-buster


RUN apt-get update
RUN apt-get install -y wget

 
COPY ./payment-service/target/*.jar payment-service.jar

EXPOSE 8080

CMD ["java","-jar","payment-service.jar"]   
