pipeline {
    agent any

    environment {
        LOG_FILE = '/var/log/pr_received.log'
    }

    stages {
        stage('Checkout Main') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']],
                          userRemoteConfigs: [[url: 'https://github.com/Tejaswa09/gitRepo']]])
            }
        }

        stage('Checkout Target Branch') {
            steps {
                script {
                    def targetBranch = env.CHANGE_TARGET ?: 'main'
                    checkout([$class: 'GitSCM', branches: [[name: targetBranch]],
                              userRemoteConfigs: [[url: 'https://github.com/Tejaswa09/gitRepo']]])
                }
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
                        echo "$(date +'%Y-%m-%d %H:%M:%S') - PR received: ID=${pr_id}, Author=${pr_author}, Title=${pr_title}" >> ${LOG_FILE}
                    """
                }
            }
        }
    }

    post
