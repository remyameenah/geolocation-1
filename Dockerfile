FROM openjdk:11.0.7
ADD target/bioMedical-0.0.5-RELEASE.jar bioMedical-0.0.5-RELEASE.jar
EXPOSE 8081
ENTRYPOINT ["-java","-jar","bioMedical-0.0.5-RELEASE.jar"]