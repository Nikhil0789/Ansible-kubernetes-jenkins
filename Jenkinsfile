pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', credentialsId: '5750d59c-eec8-4ddf-b967-8d1ae9185416', url: 'https://github.com/Nikhil0789/Ansible-kubernetes-jenkins.git'
            }
        }
        stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'terraform'
                    env.PATH = "{tfHome}:${env.PATH}"
                }
            }
        }
        stage('Terraform INIT')
                {

                    steps {
                        dir("terraform")
                                {
                                    // withCredentials([usernamePassword(credentialsId: 'abff6f2b-1e5b-4d20-a171-4c026691922d', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                                        sh 'terraform init'
                                        sh 'terraform validate'
                                    //}
                                }
                    }
                }



    }

}