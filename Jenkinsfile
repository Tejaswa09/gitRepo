pipeline {
    agent any

    environment {
        LOG_FILE = '/var/log/pr_received.log'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                checkout scm
            }
        }
        
        stage('Log PR Details') {
            steps {
                script {
                    // Get PR details from environment variables
                    def pr_id = env.CHANGE_ID
                    def pr_author = env.CHANGE_AUTHOR
                    def pr_title = env.CHANGE_TITLE

                    // Log the PR details to the log file
                    sh """
                        #!/bin/bash
                        echo "$(date +'%Y-%m-%d %H:%M:%S') - PR received: ID=${pr_id}, Author=${pr_author}, Title=${pr_title}" >> ${LOG_FILE}
                    """
                }
            }
        }
    }

    post {
        always {
            // Optionally, archive the log file or perform any cleanup
            archiveArtifacts artifacts: "${LOG_FILE}", allowEmptyArchive: true
        }
    }
}
