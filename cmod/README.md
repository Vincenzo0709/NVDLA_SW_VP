# C model directory
Tested on Ubuntu 16.04.7, with 4.15.0 kernel.

This directory contains the hardware NVDLA repo, which is needed to compile the C model used by the Virtual Platform.<br>
It encapsulates [nvdla_hw](https://github.com/Vincenzo0709/nvdla_hw), forked from [nvdla/hw](https://github.com/nvdla/hw) Github repo as submodule:
- In [nvdla/](nvdla/) there is NVDLA hardware repository as submodule;
- In [script/](utils/) there is the tools paths file, needed by NVDLA cmod build.

## Overview
```
cmod/
├── nvdla/
│   ├── cmod/                                           # C model sources
│   ├── outdir/cmod                                     # Output artifacts after build
│   ├── perf/
│   ├── spec/                                           # Specification files for supported configurations
│   ├── syn/
│   ├── tools/                                          # Perl-based tools to build and other utilities
│   ├── verif/
│   ├── vmod/
│   ├── .gitignore
│   ├── LICENSE
│   ├── Makefile
│   ├── README.md
│   ├── tree.make                                       # Tools path file after make
│   └── VERSION
├── scripts/
│   └── build.sh                                        # C model build script
├── Makefile
└── README.md
```
