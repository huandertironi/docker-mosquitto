FROM eclipse-mosquitto:2.0

# Install Python for health check server
RUN apk add --no-cache python3

# Copy Mosquitto config
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Add health check server script
COPY healthcheck.py /healthcheck.py

EXPOSE 1883
EXPOSE 8080

# Run Mosquitto + health check HTTP server together
CMD mosquitto -c /mosquitto/config/mosquitto.conf & \
    python3 /healthcheck.py
