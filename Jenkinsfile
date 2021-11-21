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
               sh 'docker build -t <imageName>:<tag> -f Dockerfile .'
               sh 'docker run -p 3001:3000 <imageName>:<tag>'
           }
       }
 
       stage('Push the image in Docker Hub') {
           steps {
               sh 'docker login -u "houssem003>" -p "<wHRHUX9ZAPkqLGvwxvxB>" docker.io'
               sh 'docker tag <imageName>:<tag> <repositorie_dockerHub>/<imageName>:<tag>'
               sh 'docker push <repositorie_dockerHub>/<imageName>:<tag>'
           }
       }
   }
}
