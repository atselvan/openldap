#!/bin/bash
#
# Builds the config db and the data db

# Variables
INSTALL_DIR=/appl/openldap

# Build the config and the data db

$INSTALL_DIR/sbin/slaptest -f $INSTALL_DIR/etc/openldap/slapd.conf -F $INSTALL_DIR/etc/openldap/slapd.d -u

# Add the root entry to the data db

$INSTALL_DIR/sbin/slapadd -q -l ./initial.ldif -f $INSTALL_DIR/etc/openldap/slapd.conf

# Test the configuration

$INSTALL_DIR/sbin/slaptest -f $INSTALL_DIR/etc/openldap/slapd.conf -F $INSTALL_DIR/etc/openldap/slapd.d