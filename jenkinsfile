pipeline {
  agent any
  environment {
    REGISTRY_CREDENTIALS = 'dockerhub-credentials'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Images') {
      steps {
        bat 'docker compose build'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: env.REGISTRY_CREDENTIALS, usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          bat 'echo %PASS% | docker login -u %USER% --password-stdin'
          bat 'docker compose push'
        }
      }
    }
  }

  post {
    always {
      bat 'docker logout || ver >nul'
    }
  }
}
