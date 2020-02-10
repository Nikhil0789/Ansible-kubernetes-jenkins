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
           stage('Provision AWS CLOUD') {
               steps {
                   dir('terraform') {
                       withCredentials([usernamePassword(credentialsId: '5176c908-8ef7-4a6b-89a9-8fd8bca878eb', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                           // sh 'terraform plan  -var-file=dev.tfvars -out kubernetes.plan'
                           // sh 'terraform apply   kubernetes.plan'
                           sh 'terraform destroy -var-file=dev.tfvars  -auto-approve'
                       }



                   }



               }





           }




    }
}