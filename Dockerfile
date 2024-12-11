# Base image
FROM ubuntu:latest

# Update system and install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Create application directory
WORKDIR /my-simple-webapp

# Copy application files
COPY app.py /my-simple-webapp/app.py
COPY requirements.txt /my-simple-webapp/requirements.txt

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the application port
EXPOSE 5000

# Set the environment variable for Flask
ENV FLASK_APP=/my-simple-webapp/app.py

# Set the entry point
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
