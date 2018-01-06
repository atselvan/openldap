#!/bin/bash
#
# Builds the config db and the data db

# Variables
OPENLDAP_INSTALL_DIR=/Users/allanselvan/tools/openldap

rm -rf $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.d/*

rm -rf $OPENLDAP_INSTALL_DIR/var/openldap-data/*