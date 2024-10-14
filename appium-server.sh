#!/bin/bash

# Function to start an Appium server
start_appium_server() {
  local port=$1
  echo "Starting Appium server on port $port"
  appium -p $port > appium_$port.log 2>&1 &
}

# Check if at least one port is provided
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <port1> <port2> ... <portN>"
  exit 1
fi

# Start the Appium servers on the given ports
for port in "$@"; do
  start_appium_server $port
done

echo "Appium servers started on ports: $@"

# Optional: Uncomment to keep the script running
# tail -f /dev/null