pipeline {
    agent any
    environment {
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
