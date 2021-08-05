#!/bin/sh

# operaciones sobre la base de datos si necesario
while true; do
    if rails db:create db:migrate db:seed; then
        break
    fi
    echo Deploy command failed, retrying in 5 secs...
    sleep 5
done

exec "$@"