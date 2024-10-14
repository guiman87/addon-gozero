#!/usr/bin/env bash
set -e

# Load bashio library
source /usr/lib/bashio/bashio.sh

# Read add-on options using bashio
HOME_ASSISTANT_TOKEN=$(bashio::config 'home_assistant_token')
HOME_ASSISTANT_URL=$(bashio::config 'home_assistant_url')
REPOSITORY_URL=$(bashio::config 'repository_url')

# Check if REPOSITORY_URL is provided
if [ -z "${REPOSITORY_URL}" ]; then
  bashio::log.fatal "REPOSITORY_URL is not set. Please provide the repository URL in the add-on options."
  exit 1
fi

# Clone the repository
bashio::log.info "Cloning repository from ${REPOSITORY_URL}..."
git clone "${REPOSITORY_URL}" /app/repo

# Navigate to the app directory
cd /app/repo

# Create .env.local file from variables
bashio::log.info "Creating .env.local file..."
echo "HOME_ASSISTANT_TOKEN=${HOME_ASSISTANT_TOKEN}" > .env.local
echo "HOME_ASSISTANT_URL=${HOME_ASSISTANT_URL}" >> .env.local

# Install dependencies
bashio::log.info "Installing dependencies..."
npm install

# Build the app
bashio::log.info "Building the Next.js app..."
npm run build

# Start the app
bashio::log.info "Starting the Next.js app..."
npm run start
