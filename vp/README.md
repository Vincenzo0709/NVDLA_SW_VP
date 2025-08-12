# VP directory
Tested on Ubuntu 16.04.7, with 4.15.0 kernel.

This directory contains all targets needed to build NVDLA Virtual Platform, in two modes:
- Native mode: executes directly in user's OS environment;
- Container mode: it isolates and groups all preconfigured tools in a Docker container.

It encapsulates [nvdla_vp](https://github.com/Vincenzo0709/nvdla_vp), forked from [nvdla/vp](https://github.com/nvdla/vp) Github repo, as submodule.
- In [compiler/](compiler/) there is net compiler executable and library; for now it is needed to compile correctly.
- In [container/](container/) there is all needed to build in container mode;
- In [native/](native/) there is all needed to build in native mode;
- In [nets/](nets/) there are some example CNNs;
- In [scripts](scripts/) there are all automation scripts.

# Overview
```
vp
├── compiler/
│   ├── libnvdla_compiler.so
│   ├── nvdla_compiler
│   └── README.md
├── container/
│   ├── Dockerfile                                      # Custom container image Dockerfile
│   ├── README.md
│   └── startup.sh                                      # Script invoked at container startup
├── native/                                             # nvdla_vp submodule
│   ├── build/                                          # Outputs after VP cmake project build
│   ├── cmake/
│   ├── conf/
│   ├── docker/
│   ├── fpga/
│   ├── libs/                                           # Other needed libraries and submodules
│   ├── models/                                         # CPU and memory models
│   ├── scripts/
│   ├── src/                                            # Virtual Platform C++ top-module
│   ├── tests/                                          # Example tests
│   ├── .dockerignore
│   ├── .gitignore
│   ├── .gitlab-ci.yml
│   ├── .gitmodules
│   ├── aarch64_toplevel                                # Final VP executable
│   ├── CMakeLists.txt
│   ├── LICENSE
│   └── README.md
├── nets/                                               # Necessary files for supported CNNs
├── output/                                             # Output directory after build
│   ├── nets/                                           # Compilation outputs after build and inference outputs
│   ├── nvdla/                                          # VP environment after build
│   ├── inference.log
│   └── net_compile.log
├── scripts/                                            # Automation scripts
├── Makefile
└── README.md
```

# Build instructions
To build the Virtual Platform, from the current directory:
```
make
```
To clean up:
```
make clean
```
Or you can clean nets only:
```
make clean_nets
```

Then:
```
make run
```
to either:
- Launch the Virtual Platform in **native** mode;
- Start the Docker container in **container** mode.

To proceed, depending on which mode you selected, see [Native](/doc/run/NATIVE.md) or [Container](/doc/run/CONTAINER.md) tutorials.
