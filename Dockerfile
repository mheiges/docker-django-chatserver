FROM python:2.7-alpine

RUN mkdir -p /usr/src/app

RUN apk --no-cache add curl && \
    curl -sLo /tmp/django-websocket-redis.zip \
      https://github.com/jrief/django-websocket-redis/archive/master.zip && \
    unzip /tmp/django-websocket-redis.zip  'django-websocket-redis-master/examples/*' \
      -d /tmp && \
    cp -R /tmp/django-websocket-redis-master/examples/ /usr/src/app/chatserver && \
    rm -rf /tmp/*

RUN apk --no-cache add redis gcc musl-dev \
  linux-headers openssl-dev && \
  pip install --no-cache-dir -r /usr/src/app/chatserver/requirements.txt && \
  pip install uwsgi && \
  apk del gcc musl-dev linux-headers

ENV DJANGO_SETTINGS_MODULE=chatserver.settings

COPY start.sh /start.sh

EXPOSE 8000

WORKDIR /usr/src/app/chatserver

CMD ["/start.sh"]