pipeline {
  agent any
 
  //tools {
    //nodejs "node"
    //terraform "terraform"
  //}
 
  stages {   
     
    stage('build npm') {
        agent {
            docker { image 'node:16.13.1-alpine' }
        }
        steps {
            sh 'npm install'
            sh 'npm run build'
        }
    } 

    stage('terraform s3') {
        agent {
            docker { 
                image 'hashicorp/terraform:latest'
                args  '--entrypoint="" -u root -v /home/ec2-user/.aws:/root/.aws'
            }
        }
        steps {
            dir("./terraform") {
                sh 'terraform init'
                //sh 'terraform plan'
                sh 'terraform apply --auto-approve'
            }  
            dir("./terraform-state") {
                sh 'terraform init'
                //sh 'terraform plan'
                sh 'terraform apply -lock=false --auto-approve'
            }      
        }
    }

    stage('copy to s3'){
        agent {
            docker {
                image 'amazon/aws-cli'
                args '--entrypoint="" -u root -v /home/ec2-user/.aws:/root/.aws'
            }
        }
        steps {
          sh 'aws s3 cp dist s3://trogaev-bucket-lab/ --recursive'
          //sh 'aws s3 cp terraform/terraform.tfstate s3://trogaev-bucket-lab/'
        }

    }
    /*
    stage('copy to s3') {
      steps {
        sh 'pwd'
        sh 'ls -a'
        sh 'docker run --rm -v /home/ec2-user/.aws:/root/.aws -v /home/ec2-user/jenkins_home/workspace/test@2:/aws amazon/aws-cli s3 cp dist s3://trogaev-bucket-1/ --recursive'
      }
    }  
    */  
  }   
}


node {
    stage('sonar-scanner') {
      def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
      withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
        sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=${sonarLogin} -Dsonar.projectName=WebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/"
      }
    }
}
