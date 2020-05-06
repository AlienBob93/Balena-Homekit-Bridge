FROM balenalib/raspberry-pi-node:8-run

# install homebridge dependencies 
RUN apt-get update && apt-get install -yq --no-install-recommends \
    && apt-get install libavahi-compat-libdnssd-dev

# install homebridge
RUN npm install -g --unsafe-perm homebridge
RUN npm i homebridge-tuya-web -g

COPY config.json ~/.homebridge/config.json

# start homebridge
CMD ["homebridge"]