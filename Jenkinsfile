pipeline {
agent any

```
tools {
    jdk 'jdk17'
    nodejs 'node23'
}

environment {
    SCANNER_HOME = tool 'sonar-scanner'
}

stages {

    stage('Clean Workspace') {
        steps {
            cleanWs()
        }
    }

    stage('Checkout Code from GitHub') {
        steps {
            git branch: 'Devops-features', url: 'https://github.com/sivamani0/Book-My-Show.git'
            sh 'ls -la'
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
                    sh """
                    ${SCANNER_HOME}/bin/sonar-scanner \
                    -Dsonar.projectName=BookMyShow \
                    -Dsonar.projectKey=BookMyShow \
                    -Dsonar.sources=.
                    """
                }
            }
        }
    }

    stage('Quality Gate') {
        steps {
            waitForQualityGate abortPipeline: false
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
```

}
