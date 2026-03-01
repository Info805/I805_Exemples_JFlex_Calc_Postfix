FROM eclipse-temurin:8-jdk@sha256:2b18cfb6c436aeb64d8ebb259444f6cf43569b4298175aaff28f0645aa36d1a1 AS build
WORKDIR /src/
COPY ./ /src/
RUN ./gradlew build

FROM eclipse-temurin:8-jdk@sha256:2b18cfb6c436aeb64d8ebb259444f6cf43569b4298175aaff28f0645aa36d1a1 as calc
COPY --from=build /src/build/libs/*.jar calc.jar
CMD ["java", "-jar", "calc.jar"]