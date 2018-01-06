#!/bin/bash
#
# Builds the config db and the data db

# Variables
INSTALL_DIR=/appl/openldap
DATA_DIR=/data/openldap

rm -rf $INSTALL_DIR/etc/openldap/slapd.d/*

rm -rf $DATA_DIR