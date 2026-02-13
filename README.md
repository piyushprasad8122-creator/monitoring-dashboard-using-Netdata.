# monitoring-dashboard-using-Netdata.
Set up a basic monitoring dashboard using Netdata.
# Netdata Monitoring Automation Project

## Overview

This project demonstrates how to set up, monitor, test, and clean up a Linux system monitoring stack using **Netdata**. The goal is to understand monitoring fundamentals and basic DevOps automation using shell scripts.

The project automates:

* Installation and configuration of Netdata
* Monitoring of CPU, memory, and disk metrics
* Alerting for high CPU usage
* Load testing to validate monitoring
* Complete cleanup of the monitoring agent

This project is suitable for beginners learning DevOps, Linux automation, and monitoring concepts.

---

## Project Structure

```
netdata-monitoring/
│── setup.sh          # Installs and configures Netdata
│── test_dashboard.sh # Generates system load to test monitoring
│── cleanup.sh        # Removes Netdata and cleans the system
│── README.md         # Project documentation
```

---

## Prerequisites

* Linux system (Ubuntu 20.04+ recommended)
* sudo privileges
* Internet access

---

## Step 1: Setup and Installation

The `setup.sh` script performs the following actions:

1. Updates system packages
2. Installs required dependencies
3. Installs Netdata
4. Configures dashboard refresh interval
5. Adds a CPU usage alert
6. Restarts the Netdata service

### Run Setup

```bash
chmod +x setup.sh
./setup.sh
```

After successful execution, access the Netdata dashboard at:

```
http://localhost:19999
```

---

## Step 2: Monitoring and Dashboard

Netdata automatically monitors:

* CPU usage (per core)
* Memory and cache usage
* Disk read/write operations
* System load and uptime

The dashboard updates every 2 seconds as configured in this project.

---

## Step 3: Alert Configuration

An alert is configured for CPU usage:

* Warning: CPU usage above 80%
* Critical: CPU usage above 90%

This alert helps identify performance issues in real time.

---

## Step 4: Testing the Dashboard

The `test_dashboard.sh` script generates CPU load using the `stress` tool.

### Run Load Test

```bash
chmod +x test_dashboard.sh
./test_dashboard.sh
```

While the script is running, observe:

* CPU usage spikes in the dashboard
* Alerts triggering when thresholds are crossed

---

## Step 5: Cleanup

The `cleanup.sh` script completely removes Netdata and its configuration files.

### Run Cleanup

```bash
chmod +x cleanup.sh
./cleanup.sh
```

This returns the system to its original state.

---

## DevOps Concepts Covered

* Infrastructure automation using shell scripts
* Monitoring and observability fundamentals
* Alerting and threshold-based monitoring
* Idempotent setup and teardown
* Preparing workflows for CI/CD pipelines

---

## Future Enhancements

* Deploy Netdata on AWS EC2 (Free Tier)
* Integrate monitoring checks into CI/CD pipelines
* Add email or webhook alert notifications
* Replace Netdata with Prometheus and Grafana for advanced monitoring

---

## Conclusion

This project provides hands-on experience with system monitoring and automation. It builds a strong foundation for learning advanced DevOps tools and cloud-native monitoring solutions.
