# Docker System Administration Exercise

## Introduction

Welcome to the documentation of my project! This document is a System Administration related exercise, where I have learned to work with Docker and Docker Compose. I have constructed a total of 7 containers, each with its own unique function.

## Container Functions

1. **NGINX with TLSv1.3**
   - Description: NGINX container configured with TLSv1.3.
   
2. **WordPress and php-fpm**
   - Description: WordPress and php-fpm installed and configured.
   
3. **MariaDB**
   - Description: MariaDB container for database management.
   
4. **Redis Cache**
   - Description: Redis cache for the WordPress website, essential for proper cache management.
   
5. **FTP Server**
   - Description: FTP server container pointing to the volume of your WordPress website.
   
6. **Static Website**
   - Description: Container for a simple static website.
   
7. **cAdvisor**
   - Description: Container hosting cAdvisor to monitor Docker container resource usage.


8. **Adminer**
    - This container runs Adminer, a database management tool accessible via port 9090, providing a user-friendly interface to manage MariaDB.


## Docker and Docker Compose

### Docker

Docker is a platform that uses OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries, and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating system kernel and therefore use fewer resources than virtual machines.

### Docker Compose

Docker Compose is a tool that was developed to help define and share multi-container applications. With Compose, you can create a YAML file to define the services and with a single command, you can spin up everything. Docker Compose provides a simple way to orchestrate the use of multiple containers, ensuring they can communicate with each other and manage dependencies.

## Getting Started

### Prerequisites

- Docker
- Docker Compose

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yel-hadr/Inception.git
    cd Inception/srcs
    ```

2. Ensure Docker and Docker Compose are installed on your system.

3. Build and start the containers using Docker Compose:
    ```bash
    mkdir ./data
    mkdir ./data/wordpress ./data/mariadb
    docker-compose up --build
    ```

## Usage

After starting the Docker Compose setup, you can interact with the services as follows:

- **WordPress**: Set up your WordPress site by navigating to `https://localhost:443`.
- **MariaDB**: Used as the database for WordPress.
- **Redis**: Automatically integrates with WordPress for caching.
- **FTP Server**: Connect using an FTP client with the command `ftp -p DOCKER_IP 21` to manage WordPress files.
- **Static Website**: View the static website by navigating to `http://localhost:60`.
- **cAdvisor**: Monitor your Docker containers via the cAdvisor interface at `http://localhost:8080`.
- **Adminer**: Manage your MariaDB databases through Adminer by navigating to `http://localhost:9090`.

## Conclusion

This project demonstrates the effective use of Docker and Docker Compose to manage a multi-container environment, integrating various services required for a full-fledged web application. Each container serves a distinct purpose and works together seamlessly, showcasing the power of containerization in system administration.

For further details or troubleshooting, please refer to the respective Docker and Docker Compose documentation.

