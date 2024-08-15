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
                    echo "Username: ${docker-user}"
                    echo "Password length: ${dockerhub-username.length()}"
                }
            }
        }
        stage('Login to Docker Hub'){
           steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'docker-user', passwordVariable: 'dockerhub-pwd', usernameVariable: 'dockerhub-username')]) {
                          bat """
                                 echo %dockerhub-pwd% | docker login -u %dockerhub-username% --password-stdin
                             """
                    }
                }
            }
        }

    }
}