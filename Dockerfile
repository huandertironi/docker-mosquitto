FROM eclipse-mosquitto:2.0

RUN apk add --no-cache python3

COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY healthcheck.py /healthcheck.py

# Render requires internal port = $PORT (HTTP)
EXPOSE 10000

# MQTT port
EXPOSE 1883

CMD mosquitto -c /mosquitto/config/mosquitto.conf & \
    python3 /healthcheck.py
