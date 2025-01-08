Here is the updated **README** template for configuring a **Docker slave** on an **Ubuntu-based EC2 instance** for your React app CI/CD project:

---

# React App CI/CD with Jenkins on EC2 Instance (Ubuntu) Using Docker Slave

This project demonstrates how to set up a CI/CD pipeline for a React app using Jenkins running on an AWS EC2 Ubuntu instance, Docker for containerization, and automated deployment.

### **Project Structure**

- `Dockerfile`: Defines the container image for the React app.
- `Jenkinsfile`: Defines the Jenkins pipeline (optional, as requested, we will focus on Docker slave configuration).
- React app code: Basic React app with a build and run process.


---

## **Pre-requisites**

1. **AWS EC2 Ubuntu Instance**:
   - A running EC2 instance with **Docker** and **Jenkins** installed.
   - Ports opened for SSH (22), HTTP (80), and Jenkins (8080).

2. **GitHub Repository**:
   - The code repository where your React app is stored.

3. **Docker**:
   - Docker should be installed on both Jenkins (as the agent) and EC2 instances for building and running the containers.

4. **Jenkins**:
   - Jenkins installed on EC2 instance, used for orchestrating the CI/CD pipeline.
  
   ----

# **Docker Slave Configuration for Jenkins on EC2 (Ubuntu)**

This section provides the steps to configure a Docker slave on an **EC2 Ubuntu instance** for Jenkins to run Docker-based builds.

### **Step 1: Install Docker on Ubuntu**

1. Update the package list:
   ```bash
   sudo apt update
   ```

2. Install Docker:
   ```bash
   sudo apt install docker.io
   ```

### **Step 2: Grant Jenkins and Ubuntu Users Permission to Docker Daemon**

1. Switch to the root user:
   ```bash
   sudo su -
   ```

2. Add the **Jenkins** and **Ubuntu** users to the Docker group:
   ```bash
   usermod -aG docker jenkins
   usermod -aG docker ubuntu
   ```

3. Restart Docker to apply the changes:
   ```bash
   systemctl restart docker
   ```

### **Step 3: Restart Jenkins**

1. Once Docker has been configured, restart Jenkins to ensure that it picks up the Docker agent configuration:
   ```bash
   http://<ec2-instance-public-ip>:8080/restart
   ```

---


## **Conclusion**

This setup ensures that:
- Your **React app** is hosted on an **Ubuntu EC2 instance** using **Docker**.
- **Jenkins** automates the CI/CD process for building and deploying the app.
- You can push changes to **GitHub**, and the **GitHub webhook** will trigger Jenkins to rebuild and redeploy the updated React app.

Feel free to modify the pipeline steps and Docker configuration as per your needs.

---

Let me know if you need any adjustments to this README or further help!
