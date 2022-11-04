pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
     environment {
    registry = '767421511420.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep'
    registryCredential = 'jenkins-ecr'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/remyameenah/geolocation-1.git'
            }
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
          // Building Docker images
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        // Uploading Docker images into AWS ECR
        stage('Pushing to ECR') {
            steps{
                script {
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 767421511420.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep'
                    sh 'docker push 767421511420.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep' + ":$BUILD_NUMBER"
                }
            }
        }   
    }
}