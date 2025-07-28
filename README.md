# NVDLA Virtual Platform repository
This repository contains all needed to prepare and launch NVDLA accelerator Virtual Platform, integrating hw, sw API and VP NVDLA repos (documentation [here](https://nvdla.org/index.html)):
- cmod: NVDLA hardware repo, used to build NVDLA C model needed by VP;
- doc: install steps for all targets;
- sw: NVDLA software drivers and API;
- vp: the actual NVDLA VP build environment.

## Tools installation
You need the following tools:
- gcc-v4.8/g++-v4.8 
- python 2.7 for VP build
- python 3.5.2 for image formatting ?
- SystemC 2.3.0 library, compiled with g++-4.8
- docker 18.09.7
- cmake >2.7

All install steps are [here](/doc/install/STEPS.md).

## Build instructions
Firstly, to setup the environment:
```
source settings.sh [CONFIG] [MODE] [NET]
```

| CONFIG    | Reference  | Description |
|-----------|------------|-------------|
| nv_small  | [nv_small](https://nvdla.org/hw/v2/integration_guide.html) | Configurable version, with 64 INT8 MAC units, no SRAM and no Microcontroller (headless) |
| nv_large  | [nv_large](https://nvdla.org/hw/v2/integration_guide.html) | Configurable version, with 2048 INT8 MAC units |
| nv_full   | [nv_full](https://nvdla.org/hw/v1/integration_guide.html) | Non-configurable version, with 2048 multi-precision MAC units |

See [here](https://nvdla.org/hw/v2/scalability.html) for the configurable versions differences and features.

| MODE      | Description |
|-----------|-------------|
| native    | executes directly in the user's OS environment |
| container | it isolates and groups all preconfigured tools in a Docker container |

| NET       | Reference  | Description |
|-----------|------------|-------------|
| LeNet     | [prototxt](https://github.com/timotiusnc/mnist/blob/master/lenet.prototxt) - [caffemodel](https://github.com/timotiusnc/mnist/blob/master/lenet.caffemodel) | Returns a 10 classes tuple (digit images) | 
| AlexNet   | [prototxt](https://github.com/BVLC/caffe/blob/master/models/bvlc_alexnet/deploy.prototxt) - [caffemodel](http://dl.caffe.berkeleyvision.org/bvlc_alexnet.caffemodel) | Returns a 1000 classes tuple (image recognition) |

Then, to build all default targets (C model, software and Virtual Platform):
```
make
```
To clean up:
```
make clean
```

See the following if you want to build only specific targets.

### Hardware C model
From the top directory:
```
make cmod
```
To clean up:
```
make clean_cmod
```

See [C model](/cmod/README.md) for details.

### Software
From the top directory:
```
make sw
```
To clean up:
```
make clean_sw
```

See [Software](/sw/README.md) for details.

### Virtual Platform
From the top directory:
```
make vp
```
To clean up:
```
make clean_vp
```

To run an inference:
```
make run
```

See [Virtual Platform](/vp/README.md) for details.
