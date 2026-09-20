pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Getting source code from GitHub...'
                // If using Jenkins natively, this stage automatically handles SCM checkout
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building the Docker image...'
                    if (isUnix()) {
                        sh 'docker build -t tanvi1089/python-app .'
                    } else {
                        bat 'docker build -t tanvi1089/python-app .'
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Secures credentials using the ID created on Slide 5
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    script {
                        echo 'Logging in and pushing image...'
                        if (isUnix()) {
                            sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                            sh 'docker push tanvi1089/python-app'
                            sh 'docker logout'
                        } else {
                            bat 'docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_PASSWORD%'
                            bat 'docker push tanvi1089/python-app'
                            bat 'docker logout'
                        }
                    }
                }
            }
        }
    }
    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed!' }
    }
}
