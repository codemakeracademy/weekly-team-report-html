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
          sh 'npm install'
          sh 'npm update'
          sh 'npm install webpack'
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
          sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=GS -Dsonar.language=js"
        }

        timeout(time: 10, unit: 'MINUTES') {
          waitForQualityGate true
        }

      }
    }

  }
}