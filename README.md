## docker-django-chatserver

### About

Run the example chat server from
[django-websocket-redis](https://github.com/jrief/django-websocket-redis)
in a Docker container.


### Usage

#### Build the Docker image

    docker build -t django-chatserver .

#### Run the Docker image

    docker run -it --rm -p 8000:8000  django-chatserver

#### Run the Docker image from local source

    git clone https://github.com/jrief/django-websocket-redis.git \
      ~/Repositories/django-websocket-redis
    
    docker run -it --rm -p 8000:8000 \
      -v ~/Repositories/django-websocket-redis/examples:/usr/src/app/chatserver \
      django-chatserver  


#### Use runserver

By default the chat server runs as a uWSGI server. To use the
`manage.py runserver` development mode, set the `USE_RUNSERVER`
environment variable.

    docker run -it --rm -p 8000:8000 \
      -e USE_RUNSERVER=1 \
      -v ~/Repositories/django-websocket-redis/examples:/usr/src/app/chatserver \
      django-chatserver  

**[You can not use Safari > 10.1 with
runserver.](https://github.com/jrief/django-websocket-redis/issues/206)**
Chrome and Firefox are ok.

#### Access the chat server in a browser at
[http://localhost:8000/chat/](http://localhost:8000/chat/)