#!/bin/bash

# Log file path
LOG_FILE="/var/log/pr_received.log"

# Function to log the PR received message
log_pr_received() {
    local pr_id=$1
    local pr_author=$2
    local pr_title=$3

    echo "$(date +'%Y-%m-%d %H:%M:%S') - PR received: ID=${pr_id}, Author=${pr_author}, Title=${pr_title}" >> ${LOG_FILE}
}

# Simulating receiving PR details
PR_ID=$1
PR_AUTHOR=$2
PR_TITLE=$3

# Log the received PR
log_pr_received "${PR_ID}" "${PR_AUTHOR}" "${PR_TITLE}"
