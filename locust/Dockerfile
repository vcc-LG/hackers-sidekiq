# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install locust

# Make port 8089 available to the world outside this container
EXPOSE 8089

# Define environment variables
ENV LOCUST_FILE /app/load_test.py

RUN apt-get update && apt-get install -y curl

# Run locust when the container launches
CMD ["locust", "--host", "http://localhost:3000", "-f", "load_test.py"]
