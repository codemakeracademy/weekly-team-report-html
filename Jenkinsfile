pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-2')
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
      agent {
          docker { image 'openjdk:11' }
       }
      steps {
        script {
            def sonarqubeScannerHome = tool name: 'SonarQubeScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
            withCredentials([string(credentialsId: 'sonarLoginID', variable: 'sonarLogin'), string(credentialsId: 'SonarQubeHost', variable: 'SONARQUBE_HOST')]) {
                sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://${SONARQUBE_HOST}:9000 -Dsonar.login=${sonarLogin} -Dsonar.password=${sonarLogin} -Dsonar.projectName=WeeklyTeam -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/ -Dsonar.language=js"
            }
        }
      }
    }

    stage('Terraform - Init S3') {

		agent {
            docker {
                image 'hashicorp/terraform:latest'
                args  '--entrypoint="" -u root -v /home/ec2-user/.aws:/root/.aws'
            }
        }
        steps {
            dir("./terraform") {
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
            dir("./terraform/lock") {
            	sh 'terraform init'
                sh 'terraform apply -lock=false --auto-approve'
            }
        }
    }

    stage('AWS - Upload to S3'){
        agent {
            docker {
                image 'amazon/aws-cli'
                args '--entrypoint="" -u root -v /home/ec2-user/.aws:/root/.aws'
            }
        }
        steps {
          sh 'aws s3 cp dist s3://lab-sthree-daniil/ --recursive'
        }
    }
  }
}