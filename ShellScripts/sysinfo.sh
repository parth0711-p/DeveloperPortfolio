#!/bin/bash

# Author: Parth Badwer
# Roll Number: 2601730080
# Purpose: Generate system information report

echo "========================================"
echo "       SYSTEM INFORMATION REPORT"
echo "========================================"
echo "Name: Parth Badwer"
echo "Roll Number: 2601730080"
echo "Date: $(date)"
echo

# CPU Information
CPU_MODEL=$(lscpu | awk -F: '/Model name/ {
    gsub(/^[ \t]+/, "", $2)
    print $2
    exit
}')

CPU_CORES=$(nproc)

echo "CPU Information:"
echo "Model: $CPU_MODEL"
echo "Number of Cores: $CPU_CORES"
echo

# Memory Information
echo "Memory Information:"
free -h | awk '/^Mem:/ {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'
echo

# Top 3 Processes by CPU Usage
echo "Top 3 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4
echo

echo "========================================"
echo "Report generated successfully."
echo "========================================"
