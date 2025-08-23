## A Quick Guide to Docker Compose

Docker Compose is a tool for defining and running multi-container applications, defined using the [Compose file format](https://compose-spec.io/). 

The compose file is used to define what and how it is used to configure your Docker application’s services, networks, volumes, and more.

With your compose file(s) in place, you can create and start your application(s) with a single command: `docker compose up`.

### docker-compose.yml sample:   

The top-level [`name`](https://docs.docker.com/reference/compose-file/version-and-name/#name-top-level-element) property is defined by the Compose Specification as the project name to be used if you don't set one explicitly.
```
name: myapp

services:
  foo:
    image: busybox
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```
> <small>Please note: The top-level version property is now obsolete. It was defined for backward compatibility and is only informative. You'll receive a warning message that it is obsolete if used.</small>

A Compose file must declare a [`services`](https://docs.docker.com/reference/compose-file/services/) top-level element as a map whose keys are string representations of service names, and whose values are service definitions. A service definition contains the configuration that is applied to each service container.

```
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"

  db:
    image: postgres:13
    environment:
      POSTGRES_USER: example
      POSTGRES_DB: exampledb

  ollama:
    image: ollama/ollama:latest
    ports:
      - "11434:11434"
    volumes:
      - ./ollama_data:/root/.ollama
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

By default Compose sets up a single network for your app.  The top-level [`networks`](https://docs.docker.com/reference/compose-file/networks/) element lets you configure named networks that can be reused across multiple services.

```
networks:
  frontend:
    # Specify driver options
    driver: bridge
    driver_opts:   
      com.docker.network.bridge
      host_binding_ipv4: "127.0.0.1"   
  backend:   
    # Use a custom driver   
    driver: custom-driver
```

The top-level [`volumes`](https://docs.docker.com/reference/compose-file/volumes/) declaration lets you configure named volumes that can be reused across multiple services. To use a volume across multiple services, you must explicitly grant each service access by using the volumes attribute within the services top-level element. 

```
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data

  backup:
    image: backup-service
    volumes:
      - db-data:/var/lib/backup/data

volumes:
  db-data:
```

The top-level configs declaration defines or references configuration data that is granted to services in your Compose application.   

<small>See also: [Secrets](https://docs.docker.com/reference/compose-file/secrets/)</small>
```
configs:
  http_config:
    file: ./httpd.conf
```
The top-level [`models`](https://docs.docker.com/reference/compose-file/models/) section declares AI models that are used by your Compose application. 
```
services:
  app:
    image: app
    models:
      my_model:
        endpoint_var: MODEL_URL

models:
  my_model:
    model: ai/model
    context_size: 1024
    runtime_flags: 
      - "--a-flag"
      - "--another-flag=42"
```




For More Information on configuration options:   
 - [DockerDocs: Compose file reference](https://docs.docker.com/reference/compose-file/)
 - [DockerDocs: Docker Compose](https://docs.docker.com/compose/)
- [The Compose Specification](https://github.com/compose-spec/compose-spec/blob/main/spec.md)

See also:
 - [/docker-compose/](../docker-compose/README.md)
 - [/config/docker-compose-cfg.md](/config/docker-compose-cfg.md)
