#!/bin/bash
#
# Configuration and Make steps for openldap
# This script asumes that the openldap source tarball is kept parallel to this script

# Extract the package 
tar -xzvf openldap-2.4.45.tgz

# Browse to the openldap directory

cd openldap-2.4.45

# Variables
BDB_INSTALL_PATH="/usr/local/Cellar/berkeley-db@4/4.8.30"
OPENLDAP_INSTALL_DIR=/Users/allanselvan/tools/openldap/

# Configure
env LD_LIBRARY_PATH="-L$BDB_INSTALL_PATH/lib" LDFLAGS="-L/$BDB_INSTALL_PATH/lib" CPPFLAGS="-I$BDB_INSTALL_PATH/include" \
./configure \
--prefix="$OPENLDAP_INSTALL_DIR" \
--enable-slapd \
--enable-bdb \
--enable-overlays \
--enable-syslog \
--enable-accesslog \
--enable-auditlog \
--enable-dynlist \
--enable-ppolicy \
--enable-memberof \
--enable-constraint \
--enable-debug

# Make
make depend
make
make install

# Copying slapd.conf file
cp -r -p slapd.conf $OPENLDAP_INSTALL_DIR/etc/openldap

# Creating the config db directory

mkdir $OPENLDAP_INSTALL_DIR/etc/openldap/slapd.d

# Creating the data db directory

mkdir $OPENLDAP_INSTALL_DIR/var/openldap-data

# Cleanup

rm -rf openldap-2.4.45/