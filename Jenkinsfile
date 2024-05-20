pipeline {
    agent any  // Can be changed to a specific agent with Terraform installed
    

    stages {
        // stage('Checkout') {
            //steps {
                //git branch: 'main', // Change branch as needed
                   // credentialsId: 'your-credentials-id', // Replace with your Git credentials ID
                 //  url: 'https://github.com/Lordclintondevops/group_project.git'  // Replace with your Git repository URL
           // }
       // }

         stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Lordclintondevops/group_project.git']]])
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init' // Initialize Terraform with backend configuration (if applicable)
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan' // Run Terraform plan to see the changes
            }
        }

        stage('Terraform Apply (Optional)') {
          //  when {
              //  expression { // Optional approval stage before applying
                   // return input message: 'Apply Terraform configuration?', submitter: 'USER_ANY', ok: 'Apply'
              //  }
         //   }
            steps {
                sh 'terraform destroy -auto-apply'
               // sh 'terraform apply -auto-approve' Apply the Terraform configuration with auto-approval
            }
        }
    }
}
