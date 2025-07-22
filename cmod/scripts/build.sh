#!/bin/bash
#
# Author: Vincenzo Merola <vincenzo.merola2@unina.it>
# Description:
#       This script prepares adn executes NVDLA C model build:
#       1. Call make, and automates prompt answer with all needed;
#       2. Start the build.

cd ${NVP_CMOD_NVDLA}

# Internal Makefile prepares a file with all needed tools path, which must be passed by stdin. 
#   Prompts are:
#   PROJECTS := <CONFIG>   									  
#   CPP  := /usr/bin/cpp-4.8
#   GCC  := /usr/bin/g++-4.8
#   PERL := /usr/bin/perl
#   JAVA := /usr/bin/java (not needed)
#   SYSTEMC := /usr/local/systemc/systemc-2.3.0/
#   VERILATOR := verilator (not needed)
#   CLANG := clang (not needed)
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

# Start C model build
./tools/bin/tmake -build cmod_top