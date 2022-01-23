pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-1')
      }
    }

    stage('Build') {
      steps {
        nodejs('NodeJS 17.4.0') {
          sh 'rm package-lock.json'
          sh 'npm install -g npm'
          sh 'npm ci'
          sh 'npm install --save-dev webpack'
          sh 'npm run build'
        }

      }
    }

    stage('Done') {
      steps {
        echo 'Build Done'
      }
    }

    stage('Sonarqube') {
      environment {
        scannerHome = 'SonarQubeScanner'
      }
      steps {
        withSonarQubeEnv('sonarqube') {
          sh "${scannerHome}/bin/sonar-scanner"
        }

        timeout(time: 10, unit: 'MINUTES') {
          waitForQualityGate(abortPipeline: true)
        }

      }
    }

  }
}