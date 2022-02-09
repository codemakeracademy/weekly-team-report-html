pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: node
            image: node:16.13.1-alpine
            command:
            - cat
            tty: true
          - name: terraform
            image: hashicorp/terraform:latest
            command:
            - cat
            tty: true
          - name: cli
            image: amazon/aws-cli
            command:
            - cat
            tty: true
        '''
    }
  }
  stages {
    stage('node') {
      steps {
        container('node') {
          sh 'npm install'
          sh 'npm run build'
        }
      }
    }
    
    stage('terraform') {
      steps {
        container('terraform') {
            dir("./") {
                sh 'pwd'
                sh 'ls -la'
                sh 'terraform init'
                sh 'terraform plan'
                sh 'terraform apply --auto-approve'
            }  
        }
      }
    }
    
    stage('cli') {
      steps {
        container('cli') {
          sh 'aws s3 cp dist s3://mv-lab12345s/ --recursive --acl public-read'
        }
      }
    }
  }


         stage('sonar-scanner') {
             steps {
                 script {
                     def SONARQUBE_HOSTNAME = 'sonarqube'
                     def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                     withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
                         sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://${SONARQUBE_HOSTNAME}:30001 -Dsonar.login='admin' -Dsonar.password='admin' -Dsonar.projectName=WebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/ -Dsonar.java.binaries=build/**/*"
                     }
                 }
             }
         }
    
}
