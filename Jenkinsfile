pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                bat 'docker build -t hola-mundo-app .'
                bat '''
                if [ $(docker ps -q -f name=hola-mundo-app) ]; then
                    docker rm -f hola-mundo-app
                fi
                '''
                bat 'docker run -d --name hola-mundo-app -p 8080:8080 hola-mundo-app'
            }
        }
        stage('Infrastructure') {
            steps {
                dir('terraform') {
                    bar 'terraform init'
                    bar 'terraform apply -auto-approve'
                }
            }
        }
    }
}

