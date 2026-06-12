pipeline {
    agent {label 'Windows'}

    stages {
        stage('git checkout') {
    steps {
        script {
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub_Cred', url: 'https://github.com/pvaranasi95/Python_Flask_DevOps.git']])
        }
    }
}
        stage("Build_Docker_Image") {
            steps {
              bat """
                docker build -t ${JOB_NAME.toLowerCase()}:${BUILD_NUMBER} .
                """
            }
        }
         stage("Check_Image_Status") {
            steps {
              bat """
                docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}" ${JOB_NAME.toLowerCase()}:${BUILD_NUMBER}
                """
            }
        }
      stage("Clean_WorkSpace") {
        steps {
          cleanWs()
        }
    }
      
    }
}
