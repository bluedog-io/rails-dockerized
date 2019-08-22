FROM ruby:2.6.3-alpine

ARG APP_DIR=/usr/src/app/

RUN set -ex && \
  apk update && apk upgrade && \
  apk add --no-cache \
      build-base \
      bash \
      less \
      yarn \
      libxml2-dev \
      libxslt-dev \
      postgresql-client \
      postgresql-dev \
      tzdata && \
  apk upgrade --available && \
  apk update && apk add -u yarn && \
  rm -rf /var/cache/apk/* && \
  mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY Gemfile* $APP_DIR

RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

COPY package.json $APP_DIR
COPY yarn.lock $APP_DIR

RUN yarn install --force

COPY . $APP_DIR
