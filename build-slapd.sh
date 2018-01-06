#!/bin/bash
#
# Builds the config db and the data db

# Variables
OPENLDAP_INSTALL_DIR=/Users/allanselvan/tools/openldap

# Build the config and the data db

$OPENLDAP_INSTALL_DIR/sbin/slaptest -f $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.conf -F $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.d -u

# Add the root entry to the data db

$OPENLDAP_INSTALL_DIR/sbin/slapadd -q -l $OPENLDAP_INSTALL_DIR/initial.ldif -f $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.conf

# Test the configuration

$OPENLDAP_INSTALL_DIR/sbin/slaptest -f $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.conf -F $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.d