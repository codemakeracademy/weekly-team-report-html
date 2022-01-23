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
          sh 'npm install'
          sh 'npm run build'
        }

      }
    }

    stage('Done') {
      steps {
        echo 'Build Done'
      }
    }

  }
}