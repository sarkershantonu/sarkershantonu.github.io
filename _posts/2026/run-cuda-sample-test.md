I am going to run CUda sample in Ubuntu 

```git clone https://github.com/NVIDIA/cuda-samples.git```

```sudo apt install cmake``` 
```cmake --version```
![cmake](/images/ubuntu/nvidia/cmake-version.png)

```mkdir build && cd build```

Run cmake 
```cmake ..```
```cmake -DENABLE_CUDA_DEBUG=True ...```


https://github.com/nvidia/cuda-samples