pipeline {
    agent any

    environment {
        BRANCH_NAME = 'main'  // Set variabel BRANCH_NAME jika tidak ada
    }

    stages {
        stage('Test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "Executing pipeline for branch ${env.BRANCH_NAME}" 
                }
            }
        }

        stage('Build') {
            when {
                expression { env.BRANCH_NAME == 'main' } 
            }
            steps {
                script {
                    echo "Building the application..."
                    sh 'mvn clean install'  // Menjalankan perintah Maven untuk build aplikasi
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    echo "Running the application..."
                    sh 'java -jar target/java-maven-app-*.jar'  // Menjalankan aplikasi yang dibangun
                }
            }
        }

        stage('Deploy') {
            when {
                expression { env.BRANCH_NAME == 'main' }
            }
            steps {
                script {
                    echo "Deploying the application..."
                }
            }
        }
    }
}
