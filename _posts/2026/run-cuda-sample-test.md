I am going to run CUda sample in Ubuntu 

```git clone https://github.com/NVIDIA/cuda-samples.git```

```sudo apt install cmake``` 
```cmake --version```
![cmake](/images/ubuntu/nvidia/cmake-version.png)

```mkdir build && cd build```

- Run cmake 
```cmake ..```
```cmake -DENABLE_CUDA_DEBUG=True ...```


https://github.com/nvidia/cuda-samples


```shell
shantonu@780xtx:~/source/cuda/cuda-samples/build$ cmake ..
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- The CUDA compiler identification is NVIDIA 12.0.140
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Detecting CUDA compiler ABI info
-- Detecting CUDA compiler ABI info - done
-- Check for working CUDA compiler: /usr/bin/nvcc - skipped
-- Detecting CUDA compile features
-- Detecting CUDA compile features - done
-- Found CUDAToolkit: /usr/include (found version "12.0.140") 
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE  
-- CUDA Samples installation configured:
--   Architecture: x86_64
--   OS: linux
--   Build Type: release
--   Install Prefix: /home/shantonu/source/cuda/cuda-samples/build/bin
--   Install Directory: /home/shantonu/source/cuda/cuda-samples/build/bin/x86_64/linux/release
-- Found OpenMP_CXX: -fopenmp (found version "4.5") 
-- Found OpenMP: TRUE (found version "4.5") found components: CXX 
-- Found OpenMP_C: -fopenmp (found version "4.5") 
-- Found OpenMP: TRUE (found version "4.5")  
-- Found OpenGL: /usr/lib/x86_64-linux-gnu/libOpenGL.so   
-- Found GLUT: /usr/lib/x86_64-linux-gnu/libglut.so  
-- Found MPI_C: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so (found version "3.1") 
-- Found MPI_CXX: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi_cxx.so (found version "3.1") 
-- Found MPI: TRUE (found version "3.1")  
-- Found EGL: /usr/lib/x86_64-linux-gnu/libEGL.so  
-- Found FreeImage: /usr/lib/x86_64-linux-gnu/libfreeimage.so  
-- Could NOT find NVSCI (missing: NVSCIBUF_LIBRARY NVSCISYNC_LIBRARY NVSCIBUF_INCLUDE_DIR NVSCISYNC_INCLUDE_DIR) 
-- NvSCI not found - will not build sample 'cudaNvSci'
-- Sample 'simpleD3D11' is Windows-only - skipping
-- Sample 'simpleD3D11Texture' is Windows-only - skipping
-- Sample 'simpleD3D12' is Windows-only - skipping
-- Found Vulkan: /usr/lib/x86_64-linux-gnu/libvulkan.so (found version "1.3.275")  missing components: glslc glslangValidator
-- Looking for GLFW/glfw3.h
-- Looking for GLFW/glfw3.h - not found
-- glfw3 not found - will not build sample 'simpleVulkan'
-- glfw3 not found - will not build sample 'simpleVulkanMMAP'
-- glfw3 not found - will not build sample 'vulkanImageCUDA'
-- Using CUDA_HOME: /usr
-- Using CUDA_LIB:  /usr/lib/x86_64-linux-gnu/libcuda.so
-- Using LIBNVVM_HOME: LIBNVVM_HOME-NOTFOUND
-- Using libnvvm header:      /usr/include/nvvm.h
-- Using libnvvm header path: /usr/include
-- Using libnvvm library:     /usr/lib/x86_64-linux-gnu/libnvvm.so
-- Using rpath: /usr/lib/x86_64-linux-gnu
-- Skipping the build of the cuda-c-linking sample.
-- Configuring done (8.4s)
-- Generating done (0.2s)
-- Build files have been written to: /home/shantonu/source/cuda/cuda-samples/build

```

Note, i have missing ``` Could NOT find NVSCI (missing: NVSCIBUF_LIBRARY NVSCISYNC_LIBRARY NVSCIBUF_INCLUDE_DIR NVSCISYNC_INCLUDE_DIR)```, I will be skipping this module. 