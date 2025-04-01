# Jenkins with Docker for Laravel CI/CD 🚀

This repository contains a Dockerized Jenkins setup with Docker and Docker Compose support, specifically configured for Laravel project deployments.

## Features ✨

- Jenkins LTS on Alpine Linux (lightweight)
- Docker CLI and Docker Compose v2 pre-installed
- Pre-configured for Laravel deployments
- Memory-optimized configuration
- Includes sample deployment script for Laravel projects

## Prerequisites 📌

- Docker installed on your host machine
- Git installed
- Proper permissions to run Docker commands

## Setup Instructions 🛠

### 1. Build the Jenkins image

```sh
docker build -t jenkins .
```

### 2. Run the Jenkins container

```sh
docker-compose up -d
```

### 3. Get the initial admin password

```sh
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### 4. Access Jenkins

Open your browser and navigate to:

```text
http://localhost:8080
```

Enter the initial admin password when prompted.

### 5. Configure Jenkins

1. Install suggested plugins

2. Create an admin user

3. Configure your Jenkins instance

## Deployment Script 🚀

The included deployment script (scripts/deploy.sh) performs the following actions:

1. Updates the Laravel project code from Git

2. Runs database migrations

3. Clears various caches

4. Caches the configuration

## Customizing the Deployment Script 🛠

Edit scripts/deploy.sh to match your Laravel project requirements:

- Update PROJECT_DIR to your project path

- Update APP_CONTAINER_NAME to match your Laravel container name

- Add any additional deployment commands needed

## Rebuilding the Jenkins Image 🔄

If you make changes to the Dockerfile or need to update components:

```sh
docker build -t jenkins .  # Rebuild docker image
docker-compose down
docker-compose up -d
```

## Security Considerations 🔐
1. Change the default admin password after first login

2. Configure proper user permissions in Jenkins

3. Regularly update Jenkins and its plugins

4. Consider adding HTTPS for secure access

## Troubleshooting 🆘
- Permission issues: Ensure the Jenkins user has proper permissions on mounted volumes

- Docker commands not working: Verify the Docker socket is properly mounted

- Memory issues: Adjust the mem_limit in docker-compose.yml if needed

## License📜
This project is open source and available under the MIT License.

## Creator 👨‍💻
6ckys
This project was created and maintained by 6ckys.