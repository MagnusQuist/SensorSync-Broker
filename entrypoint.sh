#!/bin/sh

# Check if the password file is already hashed
if grep -q '$7\$' /mosquitto/config/passwd; then
  echo "Password file already hashed. Skipping hashing."
else
  echo "Hashing password file..."
  mosquitto_passwd -U /mosquitto/config/passwd
fi

# Start Mosquitto MQTT broker
exec /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
