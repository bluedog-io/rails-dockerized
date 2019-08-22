# Rails Dockerized
Initial configuration to Rails with Postgres, and Sidekiq running on Docker

### Running the Project

```
docker-compose pull &&
docker-compose run --rm app rake db:create db:migrate &&
docker-compose up --force-recreate --build
```

#### Usefull Commands

```
docker-compose run --rm app yarn install --check-files
```

```
docker-compose run --rm app rake webpacker:install
```
