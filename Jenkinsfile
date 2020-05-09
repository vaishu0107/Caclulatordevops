#!groovy
pipeline {
    agent any
   stages {
    stage('Maven Install and Build Jar') {
  steps {
       sh 'mvn clean package -DskipTests'
        }
     }
     stage('Docker Build') {
   steps {
        sh 'docker build -t vaishu0107/calculatordocker:latest .'
      }
    }
      stage('DockerHub'){
    steps{
 	    withDockerRegistry([ credentialsId: "DockerHubPush", url: "" ]){
 	    sh 'docker push vaishu0107/calculatordocker'
 	  }
     }
   }
        stage('Deploy using Rundeck') {
      agent any
      steps {
        script {
          step([$class: "RundeckNotifier",
          rundeckInstance: "Rundeck",
          shouldFailTheBuild: true,
          shouldWaitForRundeckJob: true,
          options: """
            BUILD_VERSION=$BUILD_NUMBER
          """,
          jobId: "598fa64f-7862-459f-aebb-86156b82aaf8"])
        }
      }
    }
   }
 }
