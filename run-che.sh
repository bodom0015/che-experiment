#!/bin/sh

#docker run -d --net=host \
#  --name=codenvy \
#  -v /var/run/docker.sock:/var/run/docker.sock \
#  -v /home/user/che/lib:/home/user/che/lib-copy \
#  -v /home/user/che/workspaces:/home/user/che/workspaces \
#  -v /home/user/che/storage:/home/user/che/storage \
#  codenvy/che $1


docker run --name=che -it --rm --net=host --privileged -e CHE_HOST=141.142.208.183 -e CHE_PORT=8080 ndslabs/che:dind
