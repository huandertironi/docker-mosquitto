FROM eclipse-mosquitto:2.0

# Copia sua config customizada
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Copia o diretório de dados (vai ser persistido depois)
COPY data /mosquitto/data

EXPOSE 1883

CMD ["mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
