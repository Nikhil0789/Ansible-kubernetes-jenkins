pipeline {
    agent any
    environment {
        tfhome = tool('terraform')
        PATH = "${tfhome}:${PATH}"

    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', credentialsId: '5750d59c-eec8-4ddf-b967-8d1ae9185416', url: 'https://github.com/Nikhil0789/Ansible-kubernetes-jenkins.git'
            }
        }
        stage('terraform version') {
            steps {

                // sh 'terraform -version'



                                 sh 'terraform -version'

            }
        }

           stage('terraform init') {
               steps {
                   dir('terraform')
                           {
                               sh 'terraform init'

                           }


               }


           }




    }
}