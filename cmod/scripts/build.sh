#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script prepares and executes NVDLA C model build:
#       1. Call make, and automates prompt answers with all needed tools path;
#       2. Start the build.

set -e

cd ${NVP_CMOD_NVDLA}

# Internal Makefile prepares a file with all needed tools path, which must be passed by stdin. 
#   Prompts are like (depending on configuration):
#   PROJECTS := <CONFIG>   									  
#   CPP := /usr/bin/cpp-4.8
#   GCC := /usr/bin/gcc-4.8
#   GXX := /usr/bin/g++-4.8
#   PERL := /usr/bin/perl
#   JAVA := /usr/bin/java (not needed)
#   SYSTEMC := /usr/local/systemc/systemc-2.3.0/
#   PYTHON := /usr/bin/python
#   VERILATOR := verilator (not needed)
#   CLANG := clang (not needed)
if [ ${NVP_CONFIG} = "nv_full" ]; then
    make << EOF
$NVP_CONFIG
/usr/bin/cpp-4.8
/usr/bin/g++-4.8
/usr/bin/perl
/usr/bin/java
/usr/local/systemc/systemc-2.3.0/
verilator
clang
EOF
else
    make << EOF
$NVP_CONFIG
0

/usr/bin/cpp-4.8
/usr/bin/gcc-4.8
/usr/bin/g++-4.8
/usr/bin/perl
/usr/bin/java
/usr/local/systemc/systemc-2.3.0/
/usr/bin/python



verilator
clang
EOF
fi

# Start C model build
./tools/bin/tmake -build cmod_top
