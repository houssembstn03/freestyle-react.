pipeline {
   agent any
   environment {
      CONDITION = sh( returnStdout: true, script : 'bash numberOfContainers').trim()
   }
 
   stages {
       stage('Delete the previous image and his container') {
           when {
               environment name: 'CONDITION', value: 'true'
           }
           steps {
               echo "CONDITION = ${env.CONDITION}"
               sh 'docker rm $(docker stop $(docker ps -a -q --filter ancestor=$(docker images -q | head -n 1) --format="{{.ID}}"))'
           }
       }
stage('Create a new image') {
           steps {
               echo "CONDITION = ${env.CONDITION}"
               sh 'docker build -t gomycodeimage:v1 -f Dockerfile .'
               sh 'docker run -p 3001:3000 gomycodeimage:v1'
           }
       }
 
       stage('Push the image in Docker Hub') {
           steps {
               sh 'docker login -u "houssem003>" -p "<MyAcct.DhubHMss2022>" docker.io'
               sh 'docker tag gomycodeimage:v1 houssem003/gomycodeimage:v1'
               sh 'docker push houssem003/gomycodeimage:v1'
           }
       }
   }
}
