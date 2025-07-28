# C model directory
Tested on Ubuntu 16.04.7, with 4.15.0 kernel.

This directory contains the NVDLA hardware repo, which is needed to compile the C model used by the Virtual Platform.<br>
It encapsulates [nvdla_hw](https://github.com/Vincenzo0709/nvdla_hw), forked from [nvdla/hw](https://github.com/nvdla/hw) Github repo as submodule:
- In [nvdla/](nvdla/) there is NVDLA hardware repository as submodule;
- In [scripts/](scripts/) there is the build script.

## Overview
```
cmod/
├── nvdla/                                              # nvdla_hw submodule
│   ├── cmod/                                           # C model sources
│   ├── outdir/<CONFIG>/                                # Output artifacts after build
│   ├── perf/
│   ├── spec/                                           # Specification files for supported configurations
│   ├── syn/
│   ├── tools/                                          # Perl-based tools to build and other utilities
│   ├── verif/
│   ├── vmod/                                           # RTL model (not needed)
│   ├── .gitignore
│   ├── LICENSE
│   ├── Makefile
│   ├── README.md
│   ├── tree.make                                       # Tools path file after make
│   └── VERSION
├── scripts/
│   └── build.sh                                        # C model build script
├── .gitignore
├── Makefile
└── README.md
```

## Build instructions
To build the C model, from the current directory:
```
make
```
To clean up:
```
make clean
```
