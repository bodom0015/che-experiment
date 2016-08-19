#!/bin/sh

docker run -d -p 8086:8080 -p 8000:8000 -p 49152-49162:49152-49162 \
  --name=codenvy \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/user/che/lib:/home/user/che/lib-copy \
  -v /home/user/che/workspaces:/home/user/che/workspaces \
  -v /home/user/che/storage:/home/user/che/storage \
  codenvy/che
