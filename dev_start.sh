#!/usr/bin

if [ -e /api/tmp/pids/server.pid ]
then
    # kill -9 `cat /api/tmp/pids/server.pid` || echo "Process not running..."
    rm -f /api/tmp/pids/server.pid
fi

bundle check || bundle install
bundle exec rails s -p 3000 -b '0.0.0.0'
