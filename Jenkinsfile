pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Obtener el código del repositorio
                git url: 'https://github.com/Benja-Salas/PruebaJenkins.git', branch: 'main'
            }
        }
        stage('Unit Test') {
            steps {
                // Ejecutar las pruebas unitarias dentro de un contenedor Docker
                script {
                    docker.image('python:3.8-slim').inside {
                        sh 'pip install -r requirements.txt || true'
                        sh 'python -m unittest discover'
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("benjasalas/my-python-app:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("benjasalas/my-python-app:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
