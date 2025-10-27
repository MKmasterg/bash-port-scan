#!/bin/bash

host=$1
start_port=$2
end_port=$3

if [ -z "$host" ] || [ -z "$start_port" ] || [ -z "$end_port" ]; then
  echo "Usage: $0 <host> <start_port> <end_port>"
  exit 1
fi

if ! [[ "$start_port" =~ ^[0-9]+$ ]] || ! [[ "$end_port" =~ ^[0-9]+$ ]]; then
  echo "Ports must be numeric."
  exit 1
fi

start_time=$(date +%s%3N)

open_ports_count=0

for ((port=start_port; port<=end_port; port++)); do
  echo -n 2>/dev/null < /dev/tcp/$host/$port && echo "Port $port is open." && open_ports_count=$((open_ports_count + 1))
done

end_time=$(date +%s%3N)
execution_time=$((end_time - start_time))

all_ports=$((end_port - start_port + 1))

echo "$all_ports ports scanned in $execution_time milliseconds"
echo "$open_ports_count open ports found"