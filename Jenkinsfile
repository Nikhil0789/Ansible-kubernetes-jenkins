pipeline {
    agent any
    def tfHome = tool name: 'terraform'
    environment {
        PATH = "${tfHome}:${PATH}"

    }
    stages {
        stage('checkout') {
            steps {
                git branch: 'master', credentialsId: '5750d59c-eec8-4ddf-b967-8d1ae9185416', url: 'https://github.com/Nikhil0789/Ansible-kubernetes-jenkins.git'
            }
        }
        stage('Set Terraform path') {
            steps {

                // sh 'terraform -version'
                dir("Terraform")
                        {
                            sh 'terraform init'
                        }
            }
        }



    }
}