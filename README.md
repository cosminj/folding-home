# Folding@Home on Docker
A FAH client for the Docker engine

## What do you need?
1) docker-engine installed : https://docs.docker.com/engine/installation/
2) docker-compose installed : https://docs.docker.com/compose/install/

## Build it
```
docker-compose build
```

## Launch
1) Edit .env with your username and your team
2) Start the compose service

```
docker-compose up -d
```

The docker container will be created in detached mode with persistence accross OS restarts.

## Monitoring
If you want to check progress, the container exposes 2 ports:
- 36330 for FAHControl
- 7396 for FAH Web control
