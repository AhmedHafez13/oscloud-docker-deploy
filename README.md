# Docker Compose file

## Environment Variables

Need to add environment variables to Gitlab and use them in Docker files:

```
POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD

SECRET_KEY
ALLOWED_HOSTS
```

## Volumes

Review volumes:

- postgres_db: `/home/dashboard/postgres/data:/var/lib/postgresql/data`
- backend: `./backend:/app`

## Networks

Review networks:

```yml
networks:
  oscould_network:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.16.0.0/24
```

# Backend

- [docker-compose](./backend/docker-compose.yml)
- [Dockerfile](./backend/docker-prod-backend.Dockerfile)

## Permission

Backend application need full access to the filesystem

## Initialization

### Apply Database Migrations

```sh
python manage.py migrate
```

### Seen Initial Data

```sh
python manage.py seed_all
```

# Frontend

## Build

```sh
yarn run build
```

The output in the `dist` directory that need to be public.

## Environment Variables

Set the hostname to `VITE_API_BASH_URL`

```
NODE_ENV=production
VITE_API_BASH_URL="http://{hostname}:8000"
```
