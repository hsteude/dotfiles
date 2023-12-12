#!/bin/bash

# The default key name is 'id_ed25519', but you can pass a different one as an argument
KEY_NAME=${1:-id_ed25519}

# Set permissions for the .ssh directory
chmod 700 ~/.ssh

# Set permissions for the public key
chmod 644 ~/.ssh/${KEY_NAME}.pub

# Set permissions for the private key
chmod 600 ~/.ssh/${KEY_NAME}

