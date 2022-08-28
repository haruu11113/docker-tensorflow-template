#!/usr/bin/zsh

pip install lckr-jupyterlab-variableinspector
pip install jupyterlab-nvdashboard
pip install jupyterlab-lsp
pip install 'python-lsp-server[all]'
pip install jupyter-tensorboard
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyterlab/toc
jupyter labextension install jupyterlab-nvdashboard


