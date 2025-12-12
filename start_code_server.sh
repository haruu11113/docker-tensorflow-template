#!/bin/bash
# Start code-server with configuration
# Password: codeserver (you can change this in the script or via environment variable)

exec code-server \
  --bind-addr 0.0.0.0:8080 \
  --auth password \
  --disable-telemetry \
  /home/ec2-user/repo/
