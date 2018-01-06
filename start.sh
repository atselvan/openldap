#!/bin/bash
#
# Start Openldap

# Variables
OPENLDAP_INSTALL_DIR=/Users/allanselvan/tools/openldap

$OPENLDAP_INSTALL_DIR/libexec/slapd -h "ldap://ldap.privatesquare.in:10388"  -f $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.conf