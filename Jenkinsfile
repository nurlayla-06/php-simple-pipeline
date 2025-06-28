pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/nurlayla-06/php-simple-pipeline.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'composer install'
            }
        }

        stage('Unit Test') {
            steps {
                sh './vendor/bin/phpunit tests'
            }
            post {
                success {
                    echo 'Unit test berhasil'
                }
                failure {
                    echo 'Unit test gagal'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t php-simple-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8000:8000 php-simple-app'
            }
        }
    }
}
