pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git(url: 'https://github.com/DanielKhan-v1/weekly-team-report-html', branch: 'develop-team-1')
      }
    }

    stage('Build') {
      steps {
        sh 'cd'
        sh 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash'
        sh '. ~/.nvm/nvm.sh'
        sh 'nvm install node'
        sh 'npm run build'
      }
    }

    stage('Done') {
      steps {
        echo 'Build Done'
      }
    }

  }
}