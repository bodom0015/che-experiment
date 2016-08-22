#!/bin/sh
set -e
 
if [ "$#" -eq 0 -o "${1:0:1}" = '-' ]; then
    set -- docker daemon \
        --host=unix:///var/run/docker.sock \
        --host=tcp://0.0.0.0:2375 \
        --storage-driver=overlay \
        "$@"
fi
 
if [ "$1" = 'docker' -a "$2" = 'daemon' ]; then
    # if we're running Docker, let's pipe through dind
    # (and we'll run dind explicitly with "sh" since its shebang is /bin/bash)
    set -- sh "$(which dind)" "$@"
fi
 
nohup "$@" </dev/null >dind.log 2>&1 &

sleep 2s

/bin/sed -i 's/machine.ws_agent.max_start_time_ms=60000/machine.ws_agent.max_start_time_ms=600000/' /eclipse-che-4.5.1/conf/che.properties

/eclipse-che-4.5.1/bin/che.sh --skip:uid --remote:${CHE_HOST} --port:${CHE_PORT}
