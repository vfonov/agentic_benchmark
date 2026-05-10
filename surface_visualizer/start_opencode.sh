#! /bin/bash

if [[ -z $1 ]]; then
echo "Usage $0 <app path> ....." >&2
exit 1

fi

app=$(realpath $1)
shift

docker run -it --rm \
    --net=host \
    -u $(id -u):$(id -g) \
    -v ${app}:/app \
    -v ~/.local/share/opencode:/home/vfonov/.local/share/opencode \
    -v ~/.config/opencode:/home/vfonov/.config/opencode \
    opencode:benchmark \
    $@
