# docker-tensorflow-template



https://www.tensorflow.org/install/source

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


## check gpu is recognized
from tensorflow.python.client import device_lib
device_lib.list_local_devices()
