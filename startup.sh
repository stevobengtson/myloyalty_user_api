#!/bin/bash


if [ -e /app/tmp/pids/server.pid ]
then
    # kill -9 `cat /app/tmp/pids/server.pid` || echo "Process not running..."
    rm -f /app/tmp/pids/server.pid
fi

bundle check || bundle install
bundle exec rails db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0'
