FROM ruby:2.5.1-alpine3.7
ENV LANG C.UTF-8
RUN apk upgrade && \
    apk add --no-cache \
    bash \
    build-base \
    chromium \
    chromium-chromedriver \
    curl-dev \
    git \
    graphviz \
    imagemagick \
    imagemagick-dev \
    less \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mysql-dev \
    nodejs \
    openssl \
    readline \
    readline-dev \
    sqlite-dev \
    tar \
    ttf-freefont \
    tzdata \
    udev \
    wget \
    yaml \
    yaml-dev\
    zlib \
    zlib-dev

RUN npm install -g yarn

RUN gem install bundler
RUN gem update

ENV APP_HOME /rails_demo
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV GEM_HOME=/bundle

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=$GEM_HOME

RUN bundle install
ADD . $APP_HOME

