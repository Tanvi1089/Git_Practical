pipeline {
    agent any

    stages {
        stage('Install Docker Tool') {
            steps {
                echo 'Installing missing Docker CLI client inside Jenkins...'
                // Automatically installs the docker command utility using Debian package tools
                sh '''
                    apt-get update && \
                    apt-get install -y --no-install-recommends docker.io
                '''
            }
        }

        stage('Build Image') {
            steps {
                script {
                    echo 'Building the Python application Docker container...'
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
