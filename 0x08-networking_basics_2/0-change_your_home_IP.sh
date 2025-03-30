#!usr/bin/env bash
# configuration of the ubuntu server

# Backup the original /etc/hosts file
cp /etc/hosts /etc/hosts.bak

echo "Updating /etc/hosts to modify hostname resolution..."

# Add or update localhost resolution
if grep -q "127.0.0.2" /etc/hosts; then
    sed -i '/127.0.0.2/d' /etc/hosts
fi
echo "127.0.0.2 localhost" | tee -a /etc/hosts

# Add or update facebook.com resolution
if grep -q "facebook.com" /etc/hosts; then
    sed -i '/facebook.com/d' /etc/hosts
fi
echo "8.8.8.8 facebook.com" | tee -a /etc/hosts

echo "Host resolution updated successfully."

# Display the updated /etc/hosts
cat /etc/hosts