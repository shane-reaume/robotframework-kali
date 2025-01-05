#!/bin/bash

# Check if .env file exists and source it
if [ -f .env ]; then
    source .env
else
    echo "No .env file found. Please copy .env.template to .env and fill in your credentials."
    echo "Or provide credentials via environment variables:"
    echo "KALI_SSH_HOST, KALI_SSH_USER, KALI_SSH_PASSWORD"
    exit 1
fi

# Verify required environment variables are set
REQUIRED_VARS=("KALI_SSH_HOST" "KALI_SSH_USER" "KALI_SSH_PASSWORD")
MISSING_VARS=0

for VAR in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!VAR}" ]; then
        echo "Error: $VAR is not set"
        MISSING_VARS=1
    fi
done

if [ $MISSING_VARS -eq 1 ]; then
    echo "Please set all required environment variables in .env file or export them before running this script."
    exit 1
fi

# Run tests with environment variables
robot -v KALI_SSH_HOST:${KALI_SSH_HOST} \
      -v KALI_SSH_USER:${KALI_SSH_USER} \
      -v KALI_SSH_PASSWORD:${KALI_SSH_PASSWORD} \
      tests/ 