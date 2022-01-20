node {
    def SONARQUBE_HOSTNAME = 'sonarqube'

    def GRADLE_HOME = tool name: 'gradle-4.10.2', type: 'hudson.plugins.gradle.GradleInstallation'
    sh "${GRADLE_HOME}/bin/gradle tasks"

    stage('prep') {
        git url: 'https://github.com/Shfarrukhb/weekly-team-report-html.git'                
    }

    stage('build') {
        sh "${GRADLE_HOME}/bin/gradle build"
    }
}
