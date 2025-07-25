#!/bin/bash

# Exit on any error
set -e

echo "Stopping any existing Flask app processes..."

# Find and kill running Flask app (adjust if needed for gunicorn or other)
FLASK_PID=$(pgrep -f "python3 app.py")

if [ -n "$FLASK_PID" ]; then
  echo "Killing process ID $FLASK_PID"
  kill -9 "$FLASK_PID"
else
  echo "No running Flask app found."
fi

# Optional: clean old files
APP_DIR="/home/ec2-user/flaskapp"

if [ -d "$APP_DIR" ]; then
  echo "Cleaning up old files in $APP_DIR"
  rm -rf "$APP_DIR"/*
else
  echo "$APP_DIR does not exist, skipping cleanup"
fi

echo "server_clear.sh completed successfully."
