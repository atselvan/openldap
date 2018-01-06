#!/bin/bash
#
# Start Openldap

# Variables
INSTALL_DIR=/appl/openldap

$INSTALL_DIR/libexec/slapd -h "ldap://192.168.2.223:10389"  -f $INSTALL_DIR/etc/openldap/slapd.conf