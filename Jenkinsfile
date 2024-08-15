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
                bat 'docker build -t trkmanoj/jenkins-docker-app:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub'){
           steps{
                script {
                        withCredentials([string(credentialsId: 'dockerhub-credentials', variable: 'dockerhub-credentials')]) {
                            bat """
                                docker login -u trkmanoj -p ${dockerhub-credentials}
                            """
                        }
                    }
                }
        }

    }
}