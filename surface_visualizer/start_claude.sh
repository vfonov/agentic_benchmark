#! /bin/bash

if [[ -z $1 ]];then
echo "Usage $0 <app path> ....." >&2
exit 1
fi

app=$(realpath $1)
shift

#set -x

docker run -it --rm \
    --net=host \
    --shm-size=12gb \
    -u $(id -u):$(id -g) \
    -v $app:/app \
    -v ~/.claude:/home/vfonov/.claude \
    -v /home/vfonov/claude_home/.config:/home/vfonov/.config \
    -v /home/vfonov/claude_home/.claude.json:/home/vfonov/.claude.json \
    claude:benchmark \
    $@
