pipeline {
    agent any

    environment {
        NODE_VERSION = '18' // Sesuaikan dengan versi Node.js yang digunakan
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling source code from GitHub'
                checkout scm
            }
        }

        stage('Setup Node.js') {
            steps {
                script {
                    def nodeInstalled = sh(script: "node -v || echo 'not found'", returnStdout: true).trim()
                    if (nodeInstalled == 'not found') {
                        echo 'Node.js not found, installing...'
                        sh "curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -"
                        sh "apt-get install -y nodejs"
                    }
                    sh "node -v"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Lint Code') {
            steps {
                echo 'Running ESLint...'
                sh 'npm run lint'
            }
        }

        stage('Build Application') {
            steps {
                echo 'Building application...'
                sh 'npm run build'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running unit tests...'
                sh 'npm test'
            }
        }
    }

    post {
        success {
            echo 'Build and test successful!'
        }
        failure {
            echo 'Build failed! Check errors in the logs.'
        }
    }
}
