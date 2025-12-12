#!/bin/bash
set -euo pipefail

# Start code-server with configuration
# The password and other settings are read from ~/.config/code-server/config.yaml
# To change the password, modify code-server-config.yaml or set PASSWORD environment variable

# Use config file for settings
exec code-server /home/ec2-user/repo/
