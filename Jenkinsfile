pipeline {
    agent any

    stages {
        stage('Integration') {
            stages {
                stage('Checkout') {
                    steps {
                        // Obtener el código del repositorio
                        git url: 'https://github.com/Benja-Salas/PruebaJenkins.git', branch: 'palomo'
                    }
                }
                stage('Unit Test') {
                    agent {
                        docker {
                            image 'python:3.8-slim'
                            args '-v /var/run/docker.sock:/var/run/docker.sock'
                        }
                    }
                    steps {
                        echo 'Running Unit Tests...'
                        sh 'pip install -r requirements.txt || true'
                        sh 'python -m unittest discover'
                    }
                }
            }
        }

        stage('Deploy') {
            when {
                expression {
                    // Continuar solo si las pruebas unitarias pasan
                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def app = docker.build("usuario/my-python-app:${env.BUILD_NUMBER}")
                        app.push()
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
