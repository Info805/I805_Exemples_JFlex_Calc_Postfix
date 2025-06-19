FROM eclipse-temurin:8-jdk AS build
WORKDIR /src/
COPY ./ /src/
RUN ./gradlew build

FROM eclipse-temurin:8-jdk as calc
COPY --from=build /src/build/libs/*.jar calc.jar
CMD ["java", "-jar", "calc.jar"]