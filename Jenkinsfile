pipeline {
    agent any
    stages {
        
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                withCredentials([file(credentialsId: 'gcp', fileVariable: 'GOOGLE_CREDENTIALS')]) {
                    sh 'gcloud auth activate-service-account --key-file=$GOOGLE_CREDENTIALS'
                    sh 'sudo terraform plan -var "credentials=${GOOGLE_CREDENTIALS}"'
                }
            }
        }
        stage('Apply') {
            steps {
                withCredentials([file(credentialsId: 'gcp', fileVariable: 'GOOGLE_CREDENTIALS')]) {
                    sh 'gcloud auth activate-service-account --key-file=$GOOGLE_CREDENTIALS'
                    sh 'sudo terraform apply -auto-approve -var "credentials=${GOOGLE_CREDENTIALS}"'
                }
            }
        }
    }
}
