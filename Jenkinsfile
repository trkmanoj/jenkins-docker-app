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
        stage('Debug Credentials') {
            steps {
                script {
                    echo "Username: ${dockerhub-username}"
                    echo "Password length: ${dockerhub-pwd.length()}"
                }
            }
        }

    }
}