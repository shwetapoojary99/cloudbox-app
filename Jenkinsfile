pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = '358530560663.dkr.ecr.us-east-1.amazonaws.com/cloudbox-repo'
    }
    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/shwetapoojary99/cloudbox-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cloudbox-repo .'
            }
        }
        stage('Login to ECR') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }
        stage('Tag & Push to ECR') {
            steps {
                sh """
                    docker tag cloudbox-repo:latest $ECR_REPO:latest
                    docker push $ECR_REPO:latest
                """
            }
        }
    }
}
