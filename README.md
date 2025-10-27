# Bash Port Scanner

A lightweight port scanner written in pure Bash. This tool allows you to scan a range of ports on any host to identify which ports are open and accepting connections.

## Core Idea

Port scanning is a fundamental network reconnaissance technique used to discover open ports on a target system. This Bash implementation uses TCP connections (`/dev/tcp`) to test port accessibility without requiring external dependencies like `nmap` or `netcat`.

The scanner:
- Tests each port in a specified range by attempting to establish a TCP connection
- Reports which ports are open and responsive

## Usage

```bash
bash ./main.sh <host> <start_port> <end_port>
```

### Parameters

- `host`: Target hostname or IP address
- `start_port`: First port in the range to scan
- `end_port`: Last port in the range to scan

### Examples

```bash
# Scan common ports on localhost
./main.sh 127.0.0.1 1 1024

# Scan a specific range on an IP address
./main.sh 192.168.1.1 20 25
```

## 📝 License

This project is open source. Please check the LICENSE file for details.
