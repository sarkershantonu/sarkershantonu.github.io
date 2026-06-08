# This is Lama CPP Basics

# Lama CPP GUI 

# LamaCpp CLI commands 

# LamaCPP Architecture 

# LamaCPP installations : Ubuntu
- install dependencies
```shell 
sudo apt update && sudo apt install -y git build-essential cmake
```
- Download Latest [release from here](https://github.com/ggml-org/llama.cpp/releases)
- Make Exutable ```chmod +x llama-cli``` and check version ```./llama-cli --version```

### Build LLamaCPP from source 
```  
git clone https://github.com/ggml-org/llama.cpp.git
```

- Create and 
``` 
mkdir build
cd build

cmake ..
cmake --build . --config Release 
```