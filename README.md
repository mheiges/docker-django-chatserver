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


#### Access the chat server in a browser at
[http://localhost:8000/chat/](http://localhost:8000/chat/)