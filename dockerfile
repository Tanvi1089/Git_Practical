# Use an official lightweight Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the local python file into the container
COPY p1.py .

# Command to run the application when the container starts
CMD ["python", "p1.py"]
