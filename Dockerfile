FROM ruby:2.5
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install
COPY . /app
