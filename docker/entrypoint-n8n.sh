#!/bin/sh

# Overrides the original start script, but there didn't seem to be much there
# https://github.com/n8n-io/n8n/blob/master/docker/images/n8n/docker-entrypoint.sh

# Function to export workflows and credentials
export_data() {
  echo "Container is shutting down. Exporting workflows and credentials..."
  
  # Create directories if they don't exist
  mkdir -p /backups/workflows
  mkdir -p /backups/credentials
  
  # Export workflows
  n8n export:workflow --backup --output=/backups/workflows
  
  # Export credentials (with --decrypted flag to ensure they can be imported elsewhere)
  n8n export:credentials --backup --decrypted --output=/backups/credentials
  
  echo "Export completed! Files saved to /backups on the host."
  
  # Exit gracefully
  exit 0
}

# Set up trap to catch SIGTERM and run export_data function
trap export_data SIGTERM SIGINT

# Start n8n in the foreground
echo "Starting n8n..."
exec n8n start