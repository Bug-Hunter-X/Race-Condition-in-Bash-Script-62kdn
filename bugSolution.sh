#!/bin/bash

# This script demonstrates a solution to the race condition bug.
# It uses a lock file to ensure that only one process can access the shared file at a time.

# Create a shared file
echo "" > shared.txt

# Function to increment the counter in the shared file using flock
increment_counter() {
  flock -x 200  # Acquire an exclusive lock on the shared file
  local counter=$(cat shared.txt)
  let counter++
  echo $counter > shared.txt
  flock -u 200 # Release the lock
}

# Create two processes that concurrently increment the counter
increment_counter &
increment_counter &
wait # Wait for both processes to finish

# Print the final counter value
cat shared.txt