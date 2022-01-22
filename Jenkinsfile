pipeline {
    agent any

    stages{

        stage('git') {
            steps {
                git url: 'https://github.com/DanielKhan-v1/weekly-team-report-html'
            }
        }

        stage('build') {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }

//         stage('sonar-scanner') {
//             def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
//             withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
//                 sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=${sonarLogin} -Dsonar.projectName=WebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/main/ -Dsonar.language=js"
//             }
//         }
    }
}