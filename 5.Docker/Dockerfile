# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Java application JAR file to the working directory
COPY your-application.jar /app/your-application.jar

# Expose the port the application runs on (optional, if your application listens on a port)
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "your-application.jar"]