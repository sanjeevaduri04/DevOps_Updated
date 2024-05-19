#!/bin/bash

# Check if the httpd service is running using systemctl
if systemctl is-active --quiet httpd; then
    echo "The httpd service is running."
else
    echo "The httpd service is not running."
fi