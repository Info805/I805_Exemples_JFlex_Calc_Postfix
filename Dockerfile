FROM eclipse-temurin:8-jdk@sha256:0b793df1b9217f3d25c5f820d47e85a20b0a78b0ccd0ab6deb9051502493c855 AS build
WORKDIR /src/
COPY ./ /src/
RUN ./gradlew build

FROM eclipse-temurin:8-jdk@sha256:0b793df1b9217f3d25c5f820d47e85a20b0a78b0ccd0ab6deb9051502493c855 as calc
COPY --from=build /src/build/libs/*.jar calc.jar
CMD ["java", "-jar", "calc.jar"]