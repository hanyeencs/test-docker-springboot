# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set environment variables for Spring Boot
ENV SPRING_PROFILES_ACTIVE=production
ENV SERVER_PORT=80

# Create a directory to store your Spring Boot application
WORKDIR /app

# Copy the Spring Boot application JAR file into the container
# COPY target/your-spring-boot-app.jar /app/app.jar

# Copy the Spring Boot application source code and build the JAR
COPY . /app/
RUN ./mvnw clean package

# Expose port 80 for Tomcat
EXPOSE 80

# Define the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]


