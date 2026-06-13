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
        script {
            shortName = JOB_NAME.split('/')[1]
        }

        bat """
        @echo off
        echo Building docker image
        docker build -t ${shortName}:${BUILD_NUMBER} .
        """
    }
}
         stage("Check_Image_Status") {
            steps {
              bat """
              @echo off
               echo "Checking Image existence"
                docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}" ${shortName}:${BUILD_NUMBER}
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
