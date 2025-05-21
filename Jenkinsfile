pipeline {
    agent any

    environment {
        IMAGE_NAME = "cloudbox-html"
        TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning source code...'
                git branch: 'main', url: 'https://github.com/shwetapoojary99/cloudbox-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh "docker build -t ${IMAGE_NAME}:${TAG} ."
                }
            }
        }

        // Optional: Uncomment this if you're pushing to ECR
        /*
        stage('Tag & Push to ECR') {
            environment {
                AWS_REGION = "us-east-1"
                ECR_REPO = "<your-ecr-repo-url>" // e.g. 123456789012.dkr.ecr.us-east-1.amazonaws.com/cloudbox-html
            }
            steps {
                script {
                    echo 'Logging in to ECR...'
                    sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO}"

                    echo 'Tagging image...'
                    sh "docker tag ${IMAGE_NAME}:${TAG} ${ECR_REPO}:${TAG}"

                    echo 'Pushing image to ECR...'
                    sh "docker push ${ECR_REPO}:${TAG}"
                }
            }
        }
        */
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
