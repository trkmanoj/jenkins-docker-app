pipeline {
    agent any
    tools {
            maven 'Maven'
        }

    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'dev', url: 'https://github.com/trkmanoj/jenkins-docker-app.git'
                }
            }
        }
        stage('Maven Build') {
                    steps {
                        // Run maven commands
                        bat 'mvn clean install -DskipTests'
                    }
                }
        stage('Login to Docker Hub'){
           steps{
                withCredentials([string(credentialsId: 'dockerhub-credentials', variable: 'dockerhub-credentials')]) {
                        bat 'docker login -u trkmanoj -p dmsswt@711'
                }
            }
        }

    }
}