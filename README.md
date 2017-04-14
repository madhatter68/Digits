# Digits

## About
This is redistribution of OpenSource version of Digit distributed by Extent of the Jam.
Just fix to be able to build for Linux.

## Build
```
ln -s <location of VST SDK> vstsdk2.4
cd linux
ln -s ../src/components/* .
ln -s ../src/digits/* .
make -f Digits.make
```
