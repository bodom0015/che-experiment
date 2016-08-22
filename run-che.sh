#!/bin/sh

docker run -d --net=host \
  --name=codenvy \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/user/che/lib:/home/user/che/lib-copy \
  -v /home/user/che/workspaces:/home/user/che/workspaces \
  -v /home/user/che/storage:/home/user/che/storage \
  codenvy/che $1
