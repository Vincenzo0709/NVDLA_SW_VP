# VP usage instructions
Here are the instruction to use the Virtual Platform either in native or container mode, after build and launch described [here](/vp/README.md).

## Initialization
After launching you will be asked to tell:
- login username: **root**
- login password: **nvdla**

In order to execute some tests or inferences, you need to:
- Mount your filesystem in */mnt*;
- Set some useful environment variables;
with:
```
mount -t 9p -o trans=virtio r /mnt
cd /mnt
source ./scripts/environment.sh
```
because of QEMU configuration file, now in */mnt* you can see the *NVDLA_SW_VP/vp* directory, with all tools and compiled nets.

## Virtual platform test
To test if the Virtual Platform was built correctly you can launch a simple "Hello world!" test:
```
./native/tests/hello/aarch64_hello
```

## Inference
To run an inference with the chosen configuration and net:
```
sh ./scripts/run_inference.sh
```

## Stop
To stop the Virtual Platform:
```
poweroff
```