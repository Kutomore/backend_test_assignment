
# Introduction

A basic car market platform with the purpose of providing a personalized selection of cars to our users. 

### Prerequisites

- Install Docker - [See Instalation](https://docs.docker.com/install/overview/)

- Install Docker Compose - [See instalation](https://docs.docker.com/compose/install/)

### Built with

- Ruby (2.7.2)

- Rails (6.1.3.2)

- PostgreSQL (10.12)

## Index

1. [Settings](#settings)

1.1. [Starting the project](#starting-the-project)

## Settings

1. `docker-compose up --build`

2. `docker-compose exec backend rails db:create`

3. `docker-compose exec backend rails db:migrate`
   
4. `docker-compose exec backend rails db:seed`

Make sure to run steps 2-4 on a separate terminal while you leave the command from step 1 running.

[top ⇈](#settings)

### Starting the project



After the configuration is finished the project is already started, it can be restarted with docker-compose


```

docker-compose up

```

After the server is started the api can be seen at

```
localhost:3000/
```

Some basic documentation can be seen at
```
localhost:3000/api-docs
```

Testing can be ran, as long as the containers are up, with:
```
docker-compose exec web bundle exec rspec
```

The requested endpoint is at /car_recommendations