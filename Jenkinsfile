pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/shwetapoojary99/cloudbox-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cloudbox-repo .'
            }
        }
        stage('Tag & Push to ECR') {
            steps {
                script {
                    def imageTag = 'latest'
                    def repoUri = '358530560663.dkr.ecr.us-east-1.amazonaws.com/cloudbox-repo'
                    sh """
                        aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${repoUri}
                        docker tag cloudbox-repo:latest ${repoUri}:${imageTag}
                        docker push ${repoUri}:${imageTag}
                    """
                }
            }
        }
    }
}
