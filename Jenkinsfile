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
   }
 }
