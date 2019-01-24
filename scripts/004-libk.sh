#!/bin/bash

 ## Exit on errors
 set -e

 ## Download the source code if it does not already exist.
 clone_git_repo github.com DaveeFTW libk psp

 ## Enter the source directory and patch the source code.
 cd libk

 ## Create and enter the build directory.
 mkdir build-psp
 cd build-psp

 ## Configure the build.
 cmake -DCMAKE_TOOLCHAIN_FILE=../../cmake/psp-toolchain.cmake -DCMAKE_INSTALL_PREFIX="$PSPDEV"/psp ..

 ## Compile and install.
 make -j $(num_cpus) clean
 make -j $(num_cpus)
 make -j $(num_cpus) install
 make -j $(num_cpus) clean
