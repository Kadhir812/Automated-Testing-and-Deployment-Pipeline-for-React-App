pipeline {
    agent any // Ensure this agent has Docker installed

    environment {
        DOCKER_IMAGE = "react-route" // Docker image name
        DOCKER_CONTAINER = "react-route-container" // Container name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Tron123ops/react-routes.git' // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the provided Dockerfile
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Run Development Container') {
            steps {
                script {
                    // Stop and remove the old container if it exists
                    sh """
                    docker stop $DOCKER_CONTAINER || true
                    docker rm $DOCKER_CONTAINER || true
                    """

                    // Run the app in development mode with hot-reloading
                    sh """
                    docker run -it -d -p 5173:5173 --name $DOCKER_CONTAINER $DOCKER_IMAGE

                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Development pipeline completed.'
        }
    }
}