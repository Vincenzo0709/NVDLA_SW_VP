# Sw directory
Tested on Ubuntu 16.04.7, with 4.15.0 kernel.

This directory contains all software artifacts and build targets needed by Virtual Platform.<br>
It encapsulates two submodules:
- [nvdla_sw](https://github.com/Vincenzo0709/nvdla_sw.git), forked from [nvdla/sw](https://github.com/nvdla/sw.git) Github repo;
- [nvdla_buildroot](https://github.com/Vincenzo0709/nvdla_buildroot.git), forked from [nvdla/buildroot](https://github.com/nvdla/buildroot.git) Github repo.

So:
- In [nvdla/kmd/](nvdla/kmd/) you can compile the NVDLA KMD (Kernel Mode Driver);
- In [nvdla/umd/](nvdla/umd/) you can compile NVDLA UMD (User Mode Driver), with application and libraries to compile CNNs and launch inferences on NVDLA accelerator;
- In [tools/](tools/) there is buildroot submodule, to compile needed linux kernel (4.13.3) and toolchain (for arm64).

## Overview
```
sw
├── nvdla/                                              # nvdla_sw submodule
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
│   ├── buildroot/                                      # nvdla_buildroot submodule
│   └── utils/
│       └── .config                                     # buildroot configuration (to avoid menuconfig)
├── .gitignore
├── Makefile
└── README.md
```

## Build instructions
To build all default targets, from the current directory:
```
make
```
To clean up:
```
make clean
```

To build KMD:
```
make kmd
```
To clean up:
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
To clean up:
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
