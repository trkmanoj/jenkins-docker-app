pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/trkmanoj/jenkins-docker-app.git'
                }
            }
        }
        stage('Maven Build') {
                    steps {
                        // Run maven commands
                        bat "mvn clean install"
                    }
                }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t trkmanoj/jenkins-docker-app:%BUILD_NUMBER% .'
            }
        }
    }
}