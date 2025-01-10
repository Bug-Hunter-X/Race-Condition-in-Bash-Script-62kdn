# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two processes concurrently attempt to increment a counter stored in a shared file. Due to the lack of proper synchronization, the final value may not be the expected value (2).

The `bug.sh` file contains the buggy code.  The `bugSolution.sh` shows the solution by using a lock mechanism to prevent concurrent access to the file.