FROM vllm/vllm-openai:v0.8.5
# GeForce は forward compat 非対応。同梱 libcuda を消してホストのドライバを使わせる
RUN rm -rf /usr/local/cuda/compat
