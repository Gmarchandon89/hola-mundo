pipeline {
    agent any
    tools {
        maven 'Maven'
        terraform 'Terraform'
    }
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
        powershell '''
        $container = docker ps -q -f name=hola-mundo-app
        if ($container) {
            docker rm -f hola-mundo-app
        }
        docker run -d --name hola-mundo-app -p 8083:8080 hola-mundo-app
        '''
    }
}

 
        stage('Infrastructure') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }
}
