pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "react-route"
        DOCKER_CONTAINER = "react-route-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Kadhir812/Automated-Testing-and-Deployment-Pipeline-for-React-App.git'
            }
        }

        stage('Set Workspace Permissions') {
            steps {
                sh 'chmod -R 775 .'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Run Development Container') {
            steps {
                script {
                    sh """
                    docker stop $DOCKER_CONTAINER || true
                    docker rm $DOCKER_CONTAINER || true
                    docker run -it -d -p 5173:5173 --name $DOCKER_CONTAINER -e PATH=\$PATH:/app/node_modules/.bin $DOCKER_IMAGE
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
