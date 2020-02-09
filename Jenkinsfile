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
<<<<<<< HEAD
        env.PATH = "${tfHome}:${env.PATH
        }
    }
    }
    stage('Terraform INIT')
    {
      steps {
        dir("terraform")
        {
        sh 'terraform init'
        }
        }
    }

=======
        env.PATH = "${tfHome}:${env.PATH}"
        }
        // sh 'terraform -version'
        dir("Terraform")
        {
        sh 'terraform init'
        }
    }
    }
>>>>>>> 002fa340ff790e9f0d3cb4e71d8d90b9d38f2cd1



}
}
