pipeline {
    agent any

    tools {
        nodejs 'nodejs'
    }

    environment {
        SONAR_TOKEN = 'sqa_45e025054c9908bf77d37ab18f967f00a12ceae1'
        SONAR_HOST_URL = 'http://15.152.142.250:9000'
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'Devops-features', url: 'https://github.com/sivamani0/Book-My-Show.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('bookmyshow-app') {
                    sh 'npm install'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                dir('bookmyshow-app') {
                    withSonarQubeEnv('sonarqube') {
                        sh '''
                        sonar-scanner \
                        -Dsonar.projectKey=bookmyshow \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=$SONAR_HOST_URL \
                        -Dsonar.login=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('bookmyshow-app') {
                    sh 'docker build -t bookmyshow-app .'
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop bookmyshow-container || true'
                sh 'docker rm bookmyshow-container || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 3000:3000 --name bookmyshow-container bookmyshow-app'
            }
        }

    }
}