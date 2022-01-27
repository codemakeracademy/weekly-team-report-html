pipeline {
    agent any
    
    tools {
        dockerTool 'docker' 
        terraform  'terraform'
    }
        
    stages {
        

        stage('prep') {
            steps {        
                git url: 'https://github.com/mivoronkov/weekly-team-report-html.git', branch: 'develop-team-2'
            }
        }
        stage('nmp-build') {
            agent {
                docker {
                    image 'node:16'
                }
           }
            steps {
                sh 'ls -la'
                //sh 'cd weekly-team-report-html'
                sh 'ls -la'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        
         stage('publish-to-s3 ') {
            agent {
                docker {
                    image 'amazon/aws-cli'
                    args "--entrypoint=''"
                }
            }
            steps {
                sh "ls -la"
                sh 'aws --version'
            }
        }

         //stage('terraform install and build') {
         //      steps {
         //      
         //    dir ("./") {
         //      sh "pwd"
         //     
         //      sh "terraform init"
         //      sh "terraform plan"
         //      sh "terraform apply --auto-approve"
         //     }//
         //   }
       //  }

         stage('deploy to S3') {
             steps {
                // sh 'aws s3 cp --profile mvoronkov . s3://mv-lab12345s --recursive --acl public-read'
                 sh 'aws s3 ls --profile mvoronkov'
             //
             }
         }

        // stage('sonar-scanner') {
        //     steps {
        //         script {
        //             def SONARQUBE_HOSTNAME = 'sonarqube'
        //             def sonarqubeScannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
        //             withCredentials([string(credentialsId: 'sonar', variable: 'sonarLogin')]) {
        //                 sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://${SONARQUBE_HOSTNAME}:9000 -Dsonar.login='admin' -Dsonar.password='admin' -Dsonar.projectName=WebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=GS -Dsonar.sources=src/ -Dsonar.java.binaries=build/**/*"
        //             }
        //         }
        //     }
        // }
    }
}
