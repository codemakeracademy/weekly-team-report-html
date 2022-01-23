pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html/tree/develop-team-1', branch: 'develop-team-1')
      }
    }

    stage('Build') {
      steps {
        sh '''npm install
npm tun build'''
      }
    }

    stage('Done') {
      steps {
        echo 'Build Done'
      }
    }

  }
}