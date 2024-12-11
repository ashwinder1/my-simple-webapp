# Base image
FROM ubuntu

# Update system and install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Create application directory
WORKDIR /myapp

# Copy application files
COPY app.py /myapp/app.py
COPY requirements.txt /myapp/requirements.txt

# Create and activate a virtual environment, then install dependencies
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the application port
EXPOSE 5000

# Set the environment variable for Flask
ENV PATH="/myapp/venv/bin:$PATH"

# Set the entry point
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]

