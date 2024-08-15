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
        stage('Build Docker Image') {
                    steps {
                        bat 'docker build -t trkmanoj/jenkins-docker-app .'
                    }
                }
        stage('publish image to hub'){
           steps{
                    withCredentials([usernamePassword(credentialsId: 'docker-user', passwordVariable: 'dockerhub-pwd', usernameVariable: 'dockerhub-username')]) {
                         bat 'docker login -u %dockerhub-username% -p %dockerhub-pwd%'
                         bat 'docker push trkmanoj/jenkins-docker-app'
                }
            }
        }

    }
}