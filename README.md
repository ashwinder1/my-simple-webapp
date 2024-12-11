# Simple Web Application to teach Docker

This is a simple web application using [Python Flask](http://flask.pocoo.org/). 
This is used in the demonstration of teaching Docker and Docker hub.
  
  Below are the steps required to get this working on a base linux system.
  
  - Install all required dependencies
  - Install and Configure Web Server
  - Start Web Server

## 1. Pull base docker image and attach its input and terminal
  
 Base image and its dependencies

    docker run -it ubuntu bash

## 2. Update system and install dependencies
  
  System and its dependencies

    apt-get update && apt-get install -y python3 python3-pip python3-venv
   
## 3. Create application directory
    
 Create a working directory
    
    /my-simple-webapp

## 4. Copy application files
  
  Copy app.py or download it from source repository

    `app.py /my-simple-webapp/app.py`
    `requirements.txt /my-simple-webapp/requirements.txt`

## 5. Install and Configure Web Server

  Create and activate a virtual environment, then install dependencies

  `RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt`

## 6. Start Web Server

Start web server

    FLASK_APP=app.py flask run --host=0.0.0.0
    
## 7. Test

Open a browser and go to URL

    http://<IP>:5000                            => Welcome
    http://<IP>:5000/how%20are%20you            => I am good, how about you?


# Steps to Use and Push the Docker Image:

## 1. Build the Image:

    `docker build -t my-dockerhub-username/my-simple-webapp .`

## 2. Run the Container:

    `docker run -p 5000:5000 my-dockerhub-username/my-simple-webapp`

##3. Push to Docker Hub:

- Login to docker hub:

  `docker login`

- Tag the image:

  `docker tag my-dockerhub-username/my-simple-webapp my-dockerhub-username/my-simple-webapp:latest`

- Push the image:

  `docker push my-dockerhub-username/my-simple-webapp:latest`

- Verify on Docker Hub: Check your repository to confirm the image is available.

