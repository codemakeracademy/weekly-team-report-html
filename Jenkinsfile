pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-1')
        sh "curl -sL https://deb.nodesource.com/setup_12.x | bash -"
        sh "npm install"
        sh "npm run build"
      }
    }

//     stage('Build') {
//       agent {
//         docker { image 'node:16.13.1-alpine' }
//       }
//       stages {
//         stage('Test') {
//           steps {
//             sh 'npm install'
//             sh 'npm run build'
//           }
//         }
//       }
      
      
//       steps {
//         nodejs('NodeJS 17.4.0') {
//           sh 'rm package-lock.json'
//           sh 'node --max-old-space-size=2048'
//           sh 'npm install'
//           sh 'npm update'
//           sh 'npm install webpack'
//           sh 'npm run build'
//         }

//       }
//     }

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
