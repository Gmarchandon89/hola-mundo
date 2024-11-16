pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t hola-mundo-app .'
                sh '''
                if [ $(docker ps -q -f name=hola-mundo-app) ]; then
                    docker rm -f hola-mundo-app
                fi
                '''
                sh 'docker run -d --name hola-mundo-app -p 8080:8080 hola-mundo-app'
            }
        }
        stage('Infrastructure') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}

