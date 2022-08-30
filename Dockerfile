FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

WORKDIR /home/docker/code
COPY . /home/docker/code

RUN conda create -n operation python=3.8 -y
SHELL ["conda", "run", "-n", "operation", "/bin/bash", "-c"]

RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-get update && apt-get install -y --no-install-recommends wget
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
RUN dpkg -i cuda-keyring_1.0-1_all.deb

RUN apt-get -y update && \ 
    apt-get install -y libgl1-mesa-glx && \
    apt-get install -y libglib2.0-0 && \
    apt-get install -y wget && \
    apt-get install -y git && \
    apt-get install -y gcc
#    apt-get install -y cuda

RUN bash ./install_script/install_packages.sh
RUN python -m pip install -r requirements.txt
RUN python -m pip uninstall -y opencv-python

RUN bash ./install_script/install_opencv.sh

#ENTRYPOINT /bin/bash
