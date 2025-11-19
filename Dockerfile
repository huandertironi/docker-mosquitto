FROM eclipse-mosquitto:2.0

RUN apk add --no-cache python3

COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY healthcheck.py /healthcheck.py

EXPOSE 8080
EXPOSE 1883

CMD mosquitto -c /mosquitto/config/mosquitto.conf & \
    python3 /healthcheck.py
