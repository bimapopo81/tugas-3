pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "Executing pipeline for branch ${BRANCH_NAME}" 
                }
            }
        }

        stage('Build') {
            when {
                expression { BRANCH_NAME == 'main' } 
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
                expression { BRANCH_NAME == 'main' }
            }
            steps {
                script {
                    echo "Deploying the application..."
                }
            }
        }
    }
}
