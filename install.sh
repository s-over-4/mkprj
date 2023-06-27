#!/bin/sh

MKPRJ_INSTALL_DIR=$HOME/.local/bin
MKPRJ_DATA_DIR=$XDG_DATA_HOME/mkprj

[ -d $MKPRJ_DATA_DIR ] || mkdir $MKPRJ_DATA_DIR

cp ./Makefile $MKPRJ_DATA_DIR/Makefile
cp ./mkprj.sh $MKPRJ_INSTALL_DIR/mkprj
chmod +x $MKPRJ_INSTALL_DIR/mkprj
