# Phalcon PHP with Nginx in Docker container

## About
This is a dockerized Phalcon PHP framework what runs by PHP-fpm.

It's accessible through Nginx. 

There are volumed logs.

It is ideally for using development and production mode.

## Versions
* PHP-FPM 8.3
* Phalcon PHP 5.6.2
* Nginx 1.25.5-alpine

## Commands
There are several useful commands with Make

### Build docker and install dependencies then run in development mode
```shell
make install-dev
```

### Build docker container based on the configuration
```shell
make build
```

### Run docker in development mode
```shell
make up
```

### Stop docker container
```shell
make down
```

### Show running containers logs output on time
```shell
make logs
```

### Show running containers logs output and wait for additional data to be appended to the input.
```shell
make tail
```

### Install dependencies with composer
```shell
make composer-install
```

## ENV
You can use .env for environment variables

## LOGS
The Nginx access.log and error.log and the PHP log is volumed into the `/logs/` directory.

---

## **Enjoy it!!**