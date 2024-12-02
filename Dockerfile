FROM python:3
RUN pip install django
COPY . .
RUN python manage.py makemigrations
RUN python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8002"]

# syntax=docker/dockerfile:1.4

# FROM --platform=$BUILDPLATFORM python:3.10-alpine AS builder
# EXPOSE 8002
# WORKDIR /app 
# # Install system dependencies
# RUN apk update
# RUN apk add \
#     pkgconfig \
#     gcc \
#     musl-dev \
#     bash \
#     mariadb-dev

# # Install any needed packages specified in requirements.txt
# COPY requirements.txt /app
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the current directory contents into the container at /usr/src/app
# COPY . /app
# # Run server
# ENTRYPOINT [ "python"]
# CMD ["manage.py", "runserver", "0.0.0.0:8002"]

# Use Python base image
# Use Python base image
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install MySQL client
RUN apt-get update && apt-get install -y default-libmysqlclient-dev gcc && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Apply migrations and collect static files
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose the default Django port
EXPOSE 8002

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8002"]

