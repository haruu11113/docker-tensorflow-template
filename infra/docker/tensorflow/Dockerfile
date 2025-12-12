# 1. Node.jsのビルダーを定義（ここを追加！）
FROM node:20-bookworm as node-builder

# 2. メインのステージ
# FROM tensorflow/tensorflow:2.10.1-gpu-py3-jupyter
FROM rapidsai/rapidsai-core:23.04-cuda11.8-runtime-ubuntu20.04-py3.10

# ベースイメージの設定を引き継ぐ
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# Node.jsバイナリをコピー（Userのコード通り）
COPY --from=node-builder /usr/local/bin/node /usr/local/bin/
COPY --from=node-builder /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# Conda環境(rapids)が参照しているnode/npmを、強制的に今回入れたv20系に向けさせる
RUN ln -sf /usr/local/bin/node /opt/conda/envs/rapids/bin/node && \
    ln -sf /usr/local/bin/npm /opt/conda/envs/rapids/bin/npm

# システムパッケージのインストール
# ※ ubuntu1804のリポジトリ追加はリスクが高いので削除推奨（必要なら戻してください）
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    tree \
    vim \
    graphviz \
    tzdata \
    software-properties-common \
    libcudnn8=8.9.1.23-1+cuda11.8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# タイムゾーン設定
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 【ここがuv導入ポイント】
# uvを公式イメージからコピーするだけでインストール完了（一番速くて安全）
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# 作業ディレクトリ
WORKDIR /home/ec2-user/repo/

# パッケージインストール
# pip install の代わりに uv pip install を使用
# --system オプションをつけることで、現在のPython環境（Conda環境）に直接入れます
RUN uv pip install --system jupyterlab

# もし requirements.txt があるならこう書けます（爆速です）
# COPY requirements.txt .
# RUN uv pip install --system -r requirements.txt

EXPOSE 8888

# ENTRYPOINTとCMD
# Tokenは固定されていますが、セキュリティ的に許容範囲ならOKです
ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token='sha1:9f1bb38324f0:51627de88937e6bd5ca35030f1eab7b5eb072667'"]

CMD ["--notebook-dir=/home/ec2-user/repo/"]
