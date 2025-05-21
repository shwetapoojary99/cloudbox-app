pipeline {
    agent any

    environment {
        IMAGE_NAME = 'cloudbox-repo'
        ECR_URL = '358530560663.dkr.ecr.us-east-1.amazonaws.com/cloudbox-repo'
        REGION = 'us-east-1'
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/shwetapoojary99/cloudbox-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Login to ECR') {
            steps {
                sh 'aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ECR_URL}'
            }
        }

        stage('Tag & Push to ECR') {
            steps {
                sh '''
                    docker tag ${IMAGE_NAME}:latest ${ECR_URL}:latest
                    docker push ${ECR_URL}:latest
                '''
            }
        }

        stage('Deploy on EC2 with Docker Compose') {
            steps {
                sh '''
                    cat <<EOF > docker-compose.yml
version: '3'
services:
  cloudbox:
    image: ${ECR_URL}:latest
    ports:
      - "80:80"
    restart: always
EOF

                    docker compose down || true
                    docker compose pull
                    docker compose up -d
                '''
            }
        }
    }
}
