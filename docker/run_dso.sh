#!/bin/bash
docker run \
    --gpus all \
    -it \
	-v /tmp/data:/root/data:rw \
	-v ${HOME}/.Xauthority:/root/.Xauthority:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--net host \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--device /dev/dri \
	dso bash

# run command
# ./dso_dataset files=../data/images calib=../data/camera.txt gamma=../data/pcalib.txt vignette=../data/vignette.png preset=0 mode=0
