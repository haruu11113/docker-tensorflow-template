#!/bin/bash
set -euo pipefail

# Start code-server with configuration
# The password and other settings are read from /root/.config/code-server/config.yaml
# This file is copied from code-server-config.yaml during the Docker build process
# To change the password, modify code-server-config.yaml and rebuild, or set PASSWORD environment variable

# Use config file for settings
exec code-server /home/ec2-user/repo/
