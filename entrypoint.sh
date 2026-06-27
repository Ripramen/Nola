#!/bin/sh
set -e

# Ensure the persistent data directory exists
mkdir -p /app/data/database

# Copy the default config if none exists in the volume yet
if [ ! -f /app/data/config.toml ]; then
    echo "No config.toml found in /app/data — copying default from config.example.toml"
    cp /app/config.example.toml /app/data/config.toml
fi

exec pnpm start --color
