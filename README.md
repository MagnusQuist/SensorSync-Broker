# SensorSync MQTT Broker

This repository contains an MQTT broker for an IoT fleet management software. The MQTT broker facilitates communication between IoT devices and the fleet management system.

## Setup

1. Create a `passwd` file within the `config` folder. This file will store the authentication credentials for accessing the MQTT broker. Formatted like this: `user:password`

2. Build the `mqtt-broker` Docker image using the provided Dockerfile:
    ```bash
    docker build -t mqtt-broker .
    ```

3. Start the services using Docker Compose:
    ```bash
    docker-compose up --build
    ```

## Testing

To publish messages to the MQTT broker, you can use the following command:
```bash
docker-compose run mqtt-pub sh -c "mosquitto_pub -h mqtt-broker -t test -m 'Hello World' -u admin -P password"
```

## Changing Password
To change the authentication password:
```bash
docker-compose exec mqtt-broker mosquitto_passwd -b /mosquitto/config/passwd admin NEWPASSWORD
```

After a password change, the MQTT broker needs to be restarted.

```bash
docker-compose restart mqtt-broker
```
 Now run the pub/sub services with the new password

### Subscribe
 ```bash
 docker-compose run mqtt-sub sh -c "mosquitto_sub -h mqtt-broker -t test -u admin -P CHANGED_PASSWORD"
```

### Publish
```bash
docker-compose run mqtt-pub sh -c "mosquitto_pub -h mqtt-broker -t test -m 'Hello World' -u admin -P CHANGED_PASSWORD"
````

## Note
Make sure to replace `NEWPASSWORD` and `CHANGED_PASSWORD` with your desired passwords when changing or using the authentication credentials.