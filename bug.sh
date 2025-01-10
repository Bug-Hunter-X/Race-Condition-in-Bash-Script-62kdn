#!/bin/bash

# This script demonstrates a race condition bug.
# It uses two processes to concurrently modify a shared file.

# Create a shared file
echo "" > shared.txt

# Function to increment the counter in the shared file
increment_counter() {
  local counter=$(cat shared.txt)
  let counter++
  echo $counter > shared.txt
}

# Create two processes that concurrently increment the counter
increment_counter &
increment_counter &
wait # Wait for both processes to finish

# Print the final counter value
cat shared.txt