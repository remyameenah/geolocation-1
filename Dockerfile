FROM openjdk:8
ADD target/bioMedical-0.0.5-SNAPSHOT.jar 
EXPOSE 8081
ENTRYPOINT ["-java","-jar","bioMedical-0.0.5-SNAPSHOT.jar"]