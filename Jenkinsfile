pipeline {
  agent {
    kubernetes {
      
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: node
            image: node:16
            command: ["cat"]
            tty: true
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
  
  
    
  stages {
    stage('node') {
      steps {
        container('node') {
          sh 'ls'
          sh 'npm install'
          sh 'npm run build'
        }
      }
    }
    
        
    stage('cli') {
      steps {
        container('cli') {
          sh 'aws ecr get-login-password --region us-west-2 > mytoken.txt'
        }
      }
    }


    stage('docker build') {
      steps{
        container('docker') {
          sh 'docker version'

          sh 'docker login --username AWS --password-stdin < mytoken.txt 529396670287.dkr.ecr.us-west-2.amazonaws.com'
          sh 'docker build -t 529396670287.dkr.ecr.us-west-2.amazonaws.com/mv_front:v1 .'
          //sh 'docker tag weekly-team-report-html:v1 529396670287.dkr.ecr.us-west-2.amazonaws.com/trogaev-ecr:v1'
          sh 'docker push 529396670287.dkr.ecr.us-west-2.amazonaws.com/mv_front:v1'
        }
      }
    }

  }
}
