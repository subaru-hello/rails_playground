ミニマム初期セットアップ
```
#Dockerfile
FROM ruby:3.0.2

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
```

```
#docker-compose.yml
version: '3'
services:
  app:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app
    ports:
      - 3000:3000
    depends_on:
      - db
    tty: true
    stdin_open: true
  db:
    platform: linux/x86_64
    image: mysql:5.7
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
volumes:
  db-volume:
```
  
```
#Gemfile

source 'https://rubygems.org'
gem 'rails', '6.1.4'
```

```
#entrypoint.sh

#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

exec "$@"
```

```
$ touch Gemfile.lock
$ rails new . --force --database=mysql
```

```
#config/database.yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password
  host: db
```

```
$ docker compose build
$ docker compose up -d
$ docker compose exec app rails db:create
```
