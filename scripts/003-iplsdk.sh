#!/bin/bash

 ## Exit on errors
 #set -e

 ## Download the source code if it does not already exist.
 clone_git_repo github.com DaveeFTW iplsdk

 ## Enter the source directory.
 cd iplsdk

 mkdir build-psp
 cd build-psp

 ## Configure the build.
 cmake -DCMAKE_TOOLCHAIN_FILE=../../cmake/bootstrap-psp-toolchain.cmake -DCMAKE_INSTALL_PREFIX="$PSPDEV"/psp ..

 ## Compile and install.
 make -j $(num_cpus) clean
 make -j $(num_cpus)
 make -j $(num_cpus) install
 make -j $(num_cpus) clean

! mkdir "$PSPDEV"/share
cp ../../../cmake/psp-toolchain.cmake "$PSPDEV"/share
