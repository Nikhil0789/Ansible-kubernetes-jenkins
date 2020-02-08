pipeline {
 agent any

 stages {
 stage('checkout') {
 steps {
 git branch: 'master', credentialsId: '5750d59c-eec8-4ddf-b967-8d1ae9185416', url: 'git@https://github.com/Nikhil0789/Ansible-kubernetes-jenkins.git'

 }
 }
 stage('Set Terraform path') {
 steps {
 script {
 def tfHome = tool name: 'Terraform'
 env.PATH = "${tfHome}:${env.PATH}"
 }
 sh 'terraform — version'


 }
 }

 stage('Provision infrastructure') {

 steps {
 dir('dev')
 {
 sh 'terraform init'
 sh 'terraform plan -out=plan'
 // sh 'terraform destroy -auto-approve'
 sh 'terraform apply plan'
 }


 }
 }



 }
}