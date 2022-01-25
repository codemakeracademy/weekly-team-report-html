pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-1')
        sh('usermod -aG sudo jenkins')
        sh('service docker start')
      }
    }

    stage('Build') {
      agent {
          docker { image 'node:16.13.1-alpine' }
       }
       steps {
        sh 'npm install'
        sh 'npm run build'
       }
//       steps {
//         nodejs('NodeJS 14.18.3') {
//           sh 'npm install'
//           sh 'npm run build'
//         }
//       }
    }

    stage('Done') {
      steps {
        echo 'Build Done'
      }
    }

    stage('Sonarqube') {
      steps {
        withSonarQubeEnv('SonarQube') {
          sh 'echo Hello world'
        }

      }
    }

  }
}