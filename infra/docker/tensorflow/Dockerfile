# python3をベースにする
FROM tensorflow/tensorflow:2.2.3-gpu-py3-jupyter
# apt-get update や apt-get upgrade の前に
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt-get update && apt-get install -y \
    curl \
    git \
    tree \
    vim \
    graphviz

RUN pip install --upgrade pip
# 作業ディレクトリを指定
WORKDIR /home/ec2-user/repo/

COPY requirements.txt /home/ec2-user/repo/
RUN pip install -r  requirements.txt

WORKDIR /home/ec2-user/repo/
RUN jupyter serverextension enable --py jupyterlab


EXPOSE 8888
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/home/ec2-user/repo/"]
