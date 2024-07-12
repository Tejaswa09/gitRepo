pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Log PR Details') {
            steps {
                script {
                    echo "Received Pull Request!"
                    echo "Event: ${env.GITHUB_EVENT_NAME}"
                    echo "Repository: ${env.GITHUB_REPOSITORY}"
                    echo "PR Number: ${env.GITHUB_PULL_REQUEST_NUMBER}"
                    echo "PR Title: ${env.GITHUB_PULL_REQUEST_TITLE}"
                    echo "PR Body: ${env.GITHUB_PULL_REQUEST_BODY}"
                    echo "PR Author: ${env.GITHUB_PULL_REQUEST_USER_LOGIN}"

                    // Print the payload JSON to log
                    def payload = readJSON text: env.GITHUB_PAYLOAD
                    echo "Payload: ${payload}"
                }
            }
        }
    }
}
