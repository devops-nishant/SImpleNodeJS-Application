pipeline {
    // Define the pipeline and specify that it can run on any available agent (Jenkins worker node)
    agent any
    
    stages {
        // Define the stages of the pipeline
        stage('Checkout') {
            // Start the "Checkout" stage
            steps {
                // Inside the "Checkout" stage, use the 'checkout scm' step to
                // check out the source code from the configured repository (e.g., Git)
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            // Start the "Build and Push Docker Image" stage
            steps {
                // Inside the "Build and Push Docker Image" stage, use the 'script' block
                // to execute custom Groovy code
                
                // Build the Docker image and assign it to the 'dockerImage' variable
                script {
                     dockerImage = docker.build('nishantgautam8848/my-nodejs-application:1.0')
                    
                }
            }
        }

        stage('Push to Docker Hub') {
            // Start the "Push to Docker Hub" stage
            steps {
                // Inside the "Push to Docker Hub" stage, use the 'script' block
                
                
                // Push the Docker image to Docker Hub using specified credentials
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        
                        
                        // Use the 'dockerImage.push()' method to push the image
                        dockerImage.push()
                    }
                }
            }
        }
    }
}