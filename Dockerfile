FROM adoptopenjdk/openjdk8:ubi
COPY /target/calc-0.0.1-SNAPSHOT.jar calc-0.0.1-SNAPSHOT.jar
CMD ["java","-cp","/calc-0.0.1-SNAPSHOT.jar","calculator"]
