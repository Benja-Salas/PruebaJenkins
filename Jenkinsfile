pipeline {
    agent any

    stages {
        stage('Integración') {
            steps {
                git branch: 'main', url: 'https://github.com/Benja-Salas/PruebaJenkins.git'
                // Puedes agregar más pasos de integración aquí si es necesario
            }
        }
        stage('Compilación') {
            steps {
                sh 'javac Helloworld.java'
            }
        }
        stage('Despliegue') {
            steps {
                script {
                    sh 'java Helloworld'
                    // Crear un nuevo contenedor
                    docker.build("contenedor-prueba")
                    docker.withRegistry('https://hub.docker.com', 'docker-credentials') {
                        docker.image("contenedor-prueba").push('latest')
                    }
                }
            }
        }
    }
}
