pipeline {
    agent any

    environment {
        PATH = "/usr/local/go/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/DimirDin/sdvps-materials.git']]
                )
            }
        }

        stage('Test') {
            steps {
                sh 'go test .'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    def imageTag = "hello-world:v${env.BUILD_NUMBER}"
                    sh "docker build -t ${imageTag} ."
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
        success {
            echo '✅ Build succeeded'
        }
        failure {
            echo '❌ Build failed'
        }
    }
}
