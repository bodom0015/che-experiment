#!/bin/sh
set -e
 
if [ "$#" -eq 0 -o "${1:0:1}" = '-' ]; then
    set -- docker daemon \
        --host=unix:///var/run/docker.sock \
        --host=tcp://0.0.0.0:2375 \
        --storage-driver=vfs \
        "$@"
fi
 
if [ "$1" = 'docker' -a "$2" = 'daemon' ]; then
    # if we're running Docker, let's pipe through dind
    # (and we'll run dind explicitly with "sh" since its shebang is /bin/bash)
    set -- sh "$(which dind)" "$@"
fi

#sudo chmod 666 /var/run/docker.sock
#docker ps
 
nohup "$@" </dev/null >dind.log 2>&1 &
/eclipse-che-4.5.1/bin/che.sh --skip:uid --remote:141.142.208.180 -p:8085
