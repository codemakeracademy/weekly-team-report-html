pipeline {
  agent {
    kubernetes {
      label 'build-service-pod'
            defaultContainer 'jnlp'
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          
          - name: terraform
            image: hashicorp/terraform:latest
            command: ["cat"]
            tty: true
          - name: cli
            image: amazon/aws-cli
            command: ["cat"]
            tty: true
        '''
    }
  }
  
  options {
        skipDefaultCheckout true
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
    


