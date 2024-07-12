#!/bin/bash

# Loop through all mounted filesystems
for fs in $(df | awk '{print $6}'); do

  # Get disk usage information for the current filesystem
  usage=$(df -h $fs | awk 'NR==2 {print $5}')

  # Extract numerical value (percentage) and convert to integer
  used_percent=$(echo $usage | sed 's/%//')

  # Set a threshold for low disk space (adjust as needed)
  threshold=20

  # Check if disk usage is above the threshold
  if [[ $used_percent -ge $threshold ]]; then
    # Print warning message for low disk space
    echo "WARNING: Disk usage on $fs is at $used_percent% (above threshold of $threshold%)"
  fi

done

# Display overall disk usage information (optional)
# df -hP

echo "Disk usage information displayed above."
