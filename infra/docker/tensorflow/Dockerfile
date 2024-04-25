# python3をベースにする
# FROM tensorflow/tensorflow:2.2.3-gpu-py3-jupyter
# FROM tensorflow/tensorflow:2.10.1-gpu-py3-jupyter
# FROM rapidsai/rapidsai-core:23.04-cuda11.8-runtime-ubuntu20.04-py3.10
FROM rapidsai/rapidsai:23.06-cuda11.8-runtime-ubuntu22.04-py3.10
# FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu18.04
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    tree \
    vim \
    graphviz \
    tzdata \
    software-properties-common \
    libcudnn8=8.9.1.23-1+cuda11.8

RUN add-apt-repository ppa:deadsnakes/ppa

# python
# RUN apt-get update && apt-get install -y python3.9 python3.9-dev python3.9-venv python3-pip
# RUN ln -s /usr/bin/python3.9 /usr/bin/python

# RUN apt-get -y install python3.9 python3.9-distutils python3-pip
# RUN python3.9 -m pip install -U pip wheel setuptools

# 作業ディレクトリを指定
WORKDIR /home/ec2-user/repo/

#COPY ../requirements.txt /home/ec2-user/repo/
## RUN pip install -r  requirements.txt
RUN pip install jupyterlab

## COPY .jupyter/ /home/ec2-user/
# RUN jupyter serverextension enable --py jupyterlab


EXPOSE 8888
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/home/ec2-user/repo/"]
