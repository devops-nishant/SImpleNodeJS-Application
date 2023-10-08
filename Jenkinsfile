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

        stage('Build the Docker Image') {
            // Start the "Build Docker Image" stage
            steps {
                // Inside the "Build Docker Image" stage, use the 'script' block
                // to execute custom Groovy code
                
                // Build the Docker image and assign it to the 'dockerImage' variable
                script {
                     dockerImage = docker.build('nishantgautam8848/my-nodejs-application:1.0')
                    
                }
            }
        }

        stage('Run Docker Container') {
            // Start the "Run Docker Container" stage
            steps {
                // Inside the "Run Docker Container" stage, use the 'script' block
                script {
                    // Run the Docker container from the built image
                    docker.image('nishantgautam8848/my-nodejs-application:1.0').run('-p 3000:3000')
                }
            }
        }

        stage('Push to Docker Hub') {
            // Start the "Push to Docker Hub" stage
            steps {
                // Inside the "Push to Docker Hub" stage, use the 'script' block
                
                // Use the credential by its ID
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-access-token', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        // Push the Docker image to Docker Hub using the specified credentials
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-access-token') {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}
