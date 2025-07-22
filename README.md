# NVDLA Virtual Platform repository
This repository contains all needed to prepare and launch NVDLA accelerator Virtual Platform, integrating sw API and VP repos (documentation [here](https://nvdla.org/index.html)):
- doc: install steps for all targets;
- cmod: NVDLA hardware repo, used to build cmod needed by VP;
- sw: NVDLA software drivers and API;
- vp: the actual NVDLA VP build environment.

## Build instructions
Firstly, to setup the environment:
```
source settings.sh <CONFIG> <MODE>
```

| CONFIG    | Description |
|-----------|-------------|
| nv_small  | 
| nv_large  | 
| nv_full   | 

| MODE      | Description
|-----------|-------------|
| native    | 
| container | 

Then, to build all default targets (software and Virtual Platform):
```
make all
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

### Software
From the top directory:
```
make sw
```
To clean up:
```
make clean_sw
```

See [Software](sw/README.md) for details.

### Virtual Platform
From the top directory:
```
make sw
```
To clean up:
```
make clean_sw
```

See [Virtual Platform](vp/README.md) for details.
