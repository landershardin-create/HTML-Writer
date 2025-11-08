#!/bin/bash

# Define valid credentials (username:password)
declare -A USERS
USERS=( ["admin"]="secret123" ["user1"]="passw0rd" ["guest"]="guest123" )

# Prompt for username
read -p "Username: " username

# Prompt for password (silent input)
read -s -p "Password: " password
echo

# Validate credentials
if [[ -n "${USERS[$username]}" && "${USERS[$username]}" == "$password" ]]; then
    echo "✅ Login successful. Welcome, $username!"
    # You can add post-login actions here
else
    echo "❌ Login failed. Invalid username or password."
    exit 1
fi