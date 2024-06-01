pipeline {
    agent any

    stages {
        stage('Integración') {
            steps {
                git branch: 'master', url: 'https://github.com/Benja-Salas/PruebaJenkins.git'
                // Puedes agregar más pasos de integración aquí si es necesario
            }
        }
        stage('Compilación') {
            steps {
                sh 'javac HelloWorld.java'
            }
        }
        stage('Despliegue') {
            steps {
                script {
                    sh 'java HelloWorld'
                    // Crear un nuevo contenedor
                    docker.build("nombre_de_tu_contenedor")
                    docker.withRegistry('https://tu_dockerhub', 'tu_credencial_dockerhub') {
                        docker.image("nombre_de_tu_contenedor").push('latest')
                    }
                }
            }
        }
    }
}
