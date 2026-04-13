## Install Windows Subsystem for Linux (WSL2)

### Step 1 - Enable the Windows Subsystem for Linux
```Powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

### Step 2 - Check requirements for running WSL 2

### Step 3 - Enable Virtual Machine feature
```Powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

### Step 4 - Download the Linux kernel update package
```Powershell
wsl.exe --install or wsl.exe --update

# Set WSL2 as default
wsl --set-default-version 2

# Verify
wsl --status
```

### Step 5 - Install Ubuntu
```Powershell
wsl --install -d Ubuntu

Enter new UNIX username: dbfn
New password: defender
Retype new password: defender
```

### Verification Steps
```Powershell
wsl --list --verbose

wsl --status
```

### Use WSL
```Powershell
wsl

ls -la
```

### openGauss on Docker Express Installation Guide

### Download Docker Desktop (Docker Personal free) and install it
### Verification
```Powershell
docker --version

# For mac users open the terminal
docker ps
```

## Install openGauss on Docker

### Step 1: Start OpenGauss for the First Time
```Powershell
docker run --name opengauss --privileged=true -d -e GS_PASSWORD=openGauss@123 -e GS_NODENAME=opengauss -p 5432:5432 -v opengauss_data:/var/lib/opengauss/data opengauss/opengauss:latest
```

### Step 2: Verify Container is Running
```Powershell
# Check running containers
docker ps

# Should see something like:
# CONTAINER ID   IMAGE                          COMMAND                  STATUS         PORTS                    NAMES
# a1b2c3d4e5f6   opengauss/opengauss:latest    "entrypoint.sh gauss..." Up 2 minutes   0.0.0.0:5432->5432/tcp   opengauss
```

### Step 3: Login to OpenGauss Container and setup OpenGauss for the first time
```Powershell
# Open another tab in PowerShell.
docker exec -it opengauss bash

# Verify openGauss is Running:
ps aux | grep gauss

# omm          1  1.5  2.7 5977868 552300 ?      Ssl  03:56   2:02 gaussdb

# You may change the root (Linux OS superuser) password using the following command:
passwd

# Type this good root password as: defender
# You need to change the omm password (openGauss superuser) via
passwd omm

# Type this good omm password as: defender
```

### Step 4: Create Database and Use gsql
```Powershell
# Change from root to omm user
su - omm
gsql -r

# When prompted for password, enter: openGauss@123
# Once inside gsql, run these SQL (structured query language) commands:

# -- Create a new database
CREATE DATABASE ad1;

# -- Connect to the new database
\c ad1

# -- Create a table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

# -- Insert some data
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com');

# -- Verify data was inserted
SELECT * FROM users;

# -- Show all databases
\l

# -- Show all tables
\dt

# -- Exit gsql
\q
exit
exit
```

### Step 6: Stop OpenGauss Gracefully
```Powershell
# Stop the container (graceful shutdown)
docker stop opengauss

# Verify it's stopped
docker ps -a
# Status should show: Exited (0)
```

### Frequently Used Docker Commands
```bash
# Container Management
docker ps                          # List running containers
docker ps -a                       # List all containers (including stopped)
docker start opengauss             # Start a stopped container
docker stop opengauss              # Stop a running container gracefully
docker restart opengauss           # Restart container
docker rm opengauss                # Remove container (must be stopped and backup first)

# Image Management
docker images                           # List downloaded images
docker pull opengauss/opengauss:latest  # Download latest image
docker rmi opengauss/opengauss:latest   # Remove image

# Monitoring & Logs
docker logs opengauss           # View container logs
docker logs -f opengauss        # Follow logs in real-time
docker stats opengauss          # Show resource usage

# Interactive Access
docker exec -it opengauss bash                            # Get bash shell in container
docker exec -it opengauss gsql -d postgres -U gaussdb -W  # Direct gsql access
```

### Returning to Your Saved Database
```Powershell
# Check if your container exists:
docker ps -a

# Start the existing container:
docker start opengauss

# Verify it's running:
docker ps

# Connect and verify your data is still there:
docker exec -it opengauss bash

# Welcome to 6.6.87.2-microsoft-standard-WSL2
# Processes:      6
# Memory used:    22.0%
# Usage On:       1%
# IP address:     172.17.0.2

# Change from root to omm user
su - omm
gsql -r

# Inside gsql, verify your previous work with SQL (Structured Query Language):
# Connect to your application database
\c ad1

# Check your tables
\dt

# Verify your data is preserved
SELECT * FROM users;

# Add more data
INSERT INTO users (name, email) VALUES ('Charlie', 'charlie@example.com');

# Verify your data is preserved
SELECT * FROM users;

# Exit
\q
exit
exit

# Stop the container (graceful shutdown):
docker stop opengauss

# Verify it is stopped:
docker ps -a
# Status should show: Exited (0)
```
