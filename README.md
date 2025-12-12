# docker-tensorflow-template

Docker-based TensorFlow development environment with JupyterLab and code-server (VS Code in browser) support.

https://www.tensorflow.org/install/source

## Documentation
- [code-server Setup Guide](docs/CODE_SERVER_SETUP.md) - Browser-based VS Code with GitHub Copilot support

# How to set up jupyter lab (jupyter notebook)

## sudo settings

## cuda settings
### bash version
echo "export PATH=/usr/local/cuda-11.4/bin:$PATH" > ~/.bashrc  
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH" > ~/.bashrc  

### bash version
echo "export PATH=/usr/local/cuda-11.4/bin:$PATH" > ~/.zshrc  
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH" > ~/.zshrc  


## run jupyter lab
make up


## run code-server (VS Code in browser)
### Start the container
make up

### Start code-server (in foreground)
make code-server

### Start code-server (in background)
make code-server-bg

### Access code-server
Open your browser and navigate to: http://localhost:8080
Default Password: codeserver

**Security Note**: For production use, change the default password in `code-server-config.yaml` or set a PASSWORD environment variable

### Features available in code-server:
- Full VS Code interface in browser
- Terminal access
- GitHub Copilot support (install extension from VS Code marketplace)
- Python development with IntelliSense
- Git integration
- File explorer

## check gpu is recognized
from tensorflow.python.client import device_lib
device_lib.list_local_devices()
