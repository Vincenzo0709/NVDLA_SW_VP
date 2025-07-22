# Sw directory
Tested on Ubuntu 16.04.7, with 4.15.0 kernel.

This directory contains all software artifacts and build targets needed by Virtual Platform.<br>
It encapsulates [nvdla_sw](https://github.com/Vincenzo0709/nvdla_sw), forked from [nvdla/sw](https://github.com/nvdla/sw) Github repo as submodule:
- In [kmd/](nvdla/kmd/) you can compile the NVDLA KMD (Kernel Mode Driver);
- In [tools/](tools/) there is buildroot submodule, to compile needed linux kernel (4.13.3) and toolchain (for arm64);
- In [umd/](nvdla/umd/) you can compile NVDLA UMD (User Mode Driver), with application and libraries to compile CNNs and launch inferences on NVDLA accelerator.

## Overview
```
sw
├── nvdla/
│   ├── kmd/
│   │   ├── Documentation/
│   │   ├── firmware/                                   # KMD source files
│   │   ├── include/
│   │   ├── port/                                       # Kernel module after compilation
│   │   ├── .gitignore
│   │   ├── Kbuild
│   │   └── Makefile
│   ├── prebuilt/                                       # Prebuilt artifacts for riscv, arm64 and x86
│   ├── regression/                                     # Some useful loadables and images for regression tests
│   ├── scripts/
│   ├── umd/
│   │   ├── apps/                                       # Application sources
│   │   ├── core/                                       # Driver sources
│   │   ├── external/                                   # Needed static libraries
│   │   ├── make/                                       # Some useful makefiles
│   │   ├── out/                                        # Artifacts after compilation
│   │   │   ├── apps/                                   # Executables after compilation
│   │   │   │   ├── compiler/
│   │   │   │   └── runtime/
│   │   │   └── core/src/                               # Shared libraries after compilation
│   │   │       ├── compiler/
│   │   │       └── runtime/
│   │   ├── port/                                       # Top modules encapsulating Linux system calls
│   │   ├── utils/
│   │   └── Makefile
│   ├── CompilerFeatures.md
│   ├── LICENSE
│   ├── LowPrecision
│   ├── README.md
│   └── Roadmap.md
├── tools/
│   ├── buildroot/                                      # buildroot submodule
│   └── utils/
│       └── .config                                     # buildroot configuration (to avoid menuconfig)
├── .gitignore
├── Makefile
└── README.md
```

## Installation
Follow this [tutorial](../doc/INSTALL_STEPS.md).

## Build
To build all default targets:
```
make
```

To build KMD:
```
make kmd
```
To cleanup:
```
make clean_kmd
```

To build UMD compiler:
```
make compiler
```
To build UMD runtime:
```
make runtime
```
To cleanup:
```
make clean_umd
```

To compile only kernel and toolchain with buildroot:
```
make buildroot
```
To clean up:
```
make clean_buildroot
```
