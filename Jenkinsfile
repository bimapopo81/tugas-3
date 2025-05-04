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
            // Pastikan file JAR yang dijalankan memiliki kelas utama yang benar
            sh 'java -jar target/java-maven-app-1.1.0-SNAPSHOT.jar'
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
