pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Getting source code from GitHub'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing the project'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project'
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
