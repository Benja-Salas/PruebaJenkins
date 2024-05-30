pipeline {
    agent any

    stages {
        stage('Integration') {
            steps {
                script {
                    echo "Cloning the repository..."
                    git url: 'https://github.com/tu-usuario/tu-repositorio.git', branch: 'main'
                }
            }
        }
        
        stage('Build') {
            steps {
                script {
                    echo "Building the project..."
                    // Aquí podrías compilar el proyecto si fuera necesario
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    try {
                        echo "Running tests..."
                        sh 'python3 -m unittest discover'
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Tests failed"
                    }
                }
            }
        }
        
        stage('Deploy') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t tu-usuario/tu-imagen:latest .'
                    
                    echo "Pushing Docker image to Docker Hub..."
                    withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_HUB_PASSWORD')]) {
                        sh 'docker login -u tu-usuario -p $DOCKER_HUB_PASSWORD'
                        sh 'docker push tu-usuario/tu-imagen:latest'
                    }
                }
            }
        }
    }
    
    post {
        failure {
            echo "The build has failed."
        }
        success {
            echo "The build was successful."
        }
    }
}
