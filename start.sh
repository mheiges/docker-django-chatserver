#!/bin/sh

echo "USE_RUNSERVER == $USE_RUNSERVER"

redis-server &

if [ ! -z $USE_RUNSERVER ] && [ $USE_RUNSERVER -eq 1 ]; then
  echo "USING RUNSEVER"
  exec python manage.py runserver 0.0.0.0:8000
else
  echo "USING uWSGI"
  exec uwsgi \
    --chdir='/usr/src/app/chatserver' \
    --module=wsgi:application \
    --master \
    --http=0.0.0.0:8000 \
    --processes=5 \
    --http-websockets \
    --vacuum
fi
