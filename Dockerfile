# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set environment variables for Spring Boot
ENV SPRING_PROFILES_ACTIVE=production
ENV SERVER_PORT=80

# Create a directory to store your Spring Boot application
WORKDIR /app

# Copy the Spring Boot application JAR file into the container
COPY HelloWorldApplication.java /app/
COPY pom.xml /app/

# Compile the Java code to generate the JAR file
RUN javac HelloWorldApplication.java

# Expose port 80 for Tomcat
EXPOSE 80

# Define the command to run your Spring Boot application
CMD ["java", "HelloWorldApplication"]
