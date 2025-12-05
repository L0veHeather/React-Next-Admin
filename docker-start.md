# Docker Startup Guide

This guide describes how to build and run the `react-next-admin` application using Docker.

## Prerequisites

- Docker installed on your machine
- Docker Compose (optional, for easier management)

---

## Method 1: Using Docker Compose (推荐)

### Start the Application

```bash
docker-compose up -d
```

This will:
- Build the Docker image (if not already built)
- Start the container in detached mode
- Map port 8080 to your host machine

### View Logs

```bash
docker-compose logs -f
```

### Stop the Application

```bash
docker-compose down
```

### Rebuild and Restart

```bash
docker-compose up -d --build
```

---

## Method 2: Using Docker Commands

### Build the Image

Run the following command in the root directory of the project:

```bash
docker build -t react-next-admin .
```

### Run the Container

Run the following command to start the container on port 8080:

```bash
docker run -d -p 8080:8080 --name react-next-admin react-next-admin
```

### View Logs

```bash
docker logs -f react-next-admin
```

### Stop and Remove Container

```bash
docker stop react-next-admin
docker rm react-next-admin
```

---

## Access the Application

Open your browser and navigate to:

**[http://localhost:8080](http://localhost:8080)**

---

## Health Check

The container includes a health check that runs every 30 seconds. Check the status:

```bash
docker ps
# or
docker-compose ps
```
