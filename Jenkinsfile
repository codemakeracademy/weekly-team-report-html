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
            - sleep
            tty: true
          - name: terraform
            image: hashicorp/terraform:latest
            command:
            - sleep
            tty: true
          - name: cli
            image: amazon/aws-cli
            command:
            - sleep
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
}


