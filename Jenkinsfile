pipeline {
    agent any

    stages {
        stage('Build Image') {
            steps {
                script {
                    echo 'Building the Python application Docker container...'
                    // Checks if Jenkins runs on Linux/Mac (Unix) or Windows
                    if (isUnix()) {
                        sh 'docker build -t tanvi1089/git_practical:latest .'
                    } else {
                        bat 'docker build -t tanvi1089/git_practical:latest .'
                    }
                }
            }
        }
        
        stage('Docker Push') {
            steps {
                // Securely injects your Docker Hub secret token credentials matching the ID 'dockerhub'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    script {
                        echo 'Pushing updated image to Docker Hub...'
                        if (isUnix()) {
                            sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                            sh 'docker push tanvi1089/git_practical:latest'
                            sh 'docker logout'
                        } else {
                            bat 'docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_PASSWORD%'
                            bat 'docker push tanvi1089/git_practical:latest'
                            bat 'docker logout'
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
