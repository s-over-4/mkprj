#!/bin/sh

MKPRJ_NAME=$1
MKPRJ_MAKEFILE=$XDG_DATA_HOME/mkprj/Makefile

mkdir -p src/include
echo "NAME := $MKPRJ_NAME" > ./Makefile
cat $MKPRJ_MAKEFILE >> ./Makefile
touch ./src/$MKPRJ_NAME.c ./src/include/$MKPRJ_NAME.h
