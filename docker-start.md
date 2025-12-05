# Docker Startup Guide

This guide describes how to build and run the `react-next-admin` application using Docker.

## Prerequisites

- Docker installed on your machine.

## Build the Image

Run the following command in the root directory of the project:

```bash
docker build -t react-next-admin .
```

## Run the Container

Run the following command to start the container on port 8080:

```bash
docker run -p 8080:8080 react-next-admin
```

## Access the Application

Open your browser and navigate to:

[http://localhost:8080](http://localhost:8080)
