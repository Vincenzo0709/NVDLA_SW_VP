# Container VP usage instructions
Here are the istructions to use the Virtual Platform in container mode.<br>
Proceed below only if you succeeded to follow the install steps [here](/doc/install/INSTALL_STEPS.md).

## Custom image generation
The Docker NVDLA VP container ([here](https://hub.docker.com/r/nvdla/vp) the DockerHub image) already has built-in needed tools. But you need to modify the configuration file an copy some artifacts inside, to get the VP ready to run in your environment.

In order to modify container image as needed, you can recompile the image using the given custom [Dockerfile](/vp/container/Dockerfile), by indicating the new image name (e.g. "nvdla_custom"):
```
cd vp/container/
sudo docker build -t <img_name> .
```
or you can use automatizing scripts, by simply calling from the top directory:
```
make
```
The new container image is named "nvdla_custom".

## Container execution
To start the container, supposing you selected container mode at the beginning, from the top directory:
```
make run
```
You will see the bash shell inside the container environment.

To stop the container:
```
exit
```

Then, to prepare the environment:
```
source ./home/vp/scripts/set_container.sh
```

## Virtual Platform launch
To launch the VP, from the current directory:
```
./home/vp/scripts/launch_vp.sh
```