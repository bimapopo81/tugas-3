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

        stage('Docker Build and Push') {
            when {
                expression { env.DOCKER_ENABLED == 'true' } // Pastikan Docker hanya dipakai jika diaktifkan
            }
            steps {
                script {
                    echo "Building Docker image and pushing to Docker Hub..."
                    // Menggunakan kredensial Docker Hub yang telah ditambahkan di Jenkins
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh 'docker build -t azeshion21/demo-app:jma-2.0 .'  // Build Docker Image
                        sh "echo $PASS | docker login -u $USER --password-stdin"  // Login ke Docker Hub
                        sh 'docker push azeshion21/demo-app:jma-2.0'  // Push image ke Docker Hub
                    }
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    echo "Running the application..."
                    // Pastikan file JAR yang dijalankan memiliki kelas utama yang benar
                    sh 'java -jar target/java-maven-app-1.1.0-SNAPSHOT.jar'  // Jalankan aplikasi
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
