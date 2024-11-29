# Django App Deployment with Docker, Jenkins, and GitHub Webhooks

This project demonstrates deploying a simple Django application to an AWS EC2 instance, containerizing it using Docker, automating the deployment process with Jenkins, and integrating GitHub webhooks for continuous integration and deployment.

## Features
- **Django App Deployment:** A basic Django application deployed on AWS EC2 that prints "Hello, World!".
- **Containerization:** The app is containerized using Docker with a custom Dockerfile and Docker image.
- **CI/CD Pipeline:** Automated Docker deployment using Jenkins installed on the EC2 instance.
- **GitHub Integration:** Configured GitHub webhooks to trigger auto-builds on Jenkins whenever changes are pushed to the repository.

## Tech Stack
- **Framework:** Django
- **Cloud Platform:** AWS EC2
- **Containerization:** Docker
- **CI/CD Tool:** Jenkins
- **Version Control:** GitHub

## Setup and Deployment

### Prerequisites
- AWS account with an EC2 instance set up
- Docker installed on the EC2 instance
- Jenkins installed and running on the EC2 instance
- GitHub repository with this project's code

### Steps to Deploy
1. **Clone the Repository:**
   ``` bash
   git clone https://github.com/Diptadip/deploying_django.git
   cd deploying_django
   ```
2. **Build the Docker Image**
	```bash
	docker build . -t django-app
	```
3. **Run the Docker Container:**    
    ```bash
    docker run -d -p 8002:8002 django-app
    ```
    
4.  **Set Up Jenkins:**    
    -  Install the necessary plugins (Git, Docker, etc.).
    -  Create a Jenkins job that pulls the repository and runs deployment scripts.
  
4.  **Configure GitHub Webhooks:**
    
    -   Go to your repository settings on GitHub.
    -   Add a webhook URL pointing to Jenkins (e.g., `http://<EC2-IP>:8080/github-webhook/`).
    -   Test the webhook and verify builds trigger automatically.
   
5.  **Access the App:** Open a browser and navigate to `http://<EC2-IP>:8002` to see the "Hello, World!" page.
    

## Future Enhancements

-  Setup Cloud Agent for Jenkins build.
-   Add logging and monitoring for deployments.
-   Scale the application using AWS ECS or Kubernetes.
-   Implement SSL/TLS for secure communication.

## Screenshots

**Jenkins auto-build from GitHub commit**

![Screenshot 2024-11-29 161100](https://github.com/user-attachments/assets/376db154-a198-49ea-8f73-4a1b81bdbd5a)

**Console Output**

![image](https://github.com/user-attachments/assets/9e1a822c-1c7b-443a-a135-bc3f8d3224c0)






  


