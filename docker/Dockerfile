FROM nvidia/opengl:1.0-glvnd-devel-ubuntu16.04
# ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# essentials
RUN apt-get update
RUN apt-get install build-essential g++ cmake git -y
RUN apt-get install freeglut3 freeglut3-dev mesa-common-dev libglu1-mesa-dev libglew-dev libglm-dev -y

# core deps
RUN apt-get install libsuitesparse-dev libeigen3-dev libboost-all-dev -y
# for visualizations and dealing with images
RUN apt-get install libopencv-dev -y
# to read data without extracting
RUN apt-get install zlib1g-dev -y

# video dependencies
RUN apt-get install ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev -y
# image dependencies
RUN apt-get install libjpeg-dev -y

# python
RUN apt-get install libpython3-dev python3-pip -y

# GUI
WORKDIR /root 
RUN git clone https://github.com/stevenlovegrove/Pangolin.git
WORKDIR /root/Pangolin
RUN mkdir build && cd build && cmake .. && cmake --build . -- -j 12
WORKDIR /root/Pangolin/build
RUN make install

# DSO
WORKDIR /root
RUN git clone https://github.com/JakobEngel/dso.git
WORKDIR /root/dso
RUN mkdir build
WORKDIR /root/dso/build
RUN cmake .. && make -j 12

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:graphics-drivers/ppa -y
