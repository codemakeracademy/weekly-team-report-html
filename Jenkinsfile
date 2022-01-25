pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
//         git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-2')
        git(url: 'https://github.com/cloudacademy/devops-webapp', branch: 'master')
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
    }

    stage('Sonarqube') {
//       agent {
//           docker { image 'openjdk:11' }
//        }
      steps {
        script {
            def sonarqubeScannerHome = tool name: 'SonarQubeScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
            withCredentials([string(credentialsId: 'sonarLoginID', variable: 'sonarLogin'), string(credentialsId: 'SonarQubeHost', variable: 'SONARQUBE_HOST')]) {
                sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://${SONARQUBE_HOST}:9000 -Dsonar.login=${sonarLogin} -Dsonar.password=${sonarLogin} -Dsonar.projectName=WebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/main/ -Dsonar.tests=src/test/ -Dsonar.java.binaries=build/**/* -Dsonar.language=java"
            }
//             -Dsonar.language=js
        }
      }
    }
  }
}