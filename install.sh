#!/bin/bash
#
# Configuration and Make steps for openldap
# This script asumes that the openldap source tarball is kept parallel to this script

# Variables
VERSION="2.4.45"
INSTALL_PATH="/appl/openldap-${VERSION}"
SOFT_LINK_PATH="/appl/openldap"

# Create the install dir
mkdir ${INSTALL_PATH}

# Download openldap package
cd /tmp
wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${VERSION}.tgz

# Extract the package 
tar -xzvf openldap-${VERSION}.tgz

# Browse to the openldap directory
cd openldap-${VERSION}

# Configure
./configure --prefix="${INSTALL_PATH}" \
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

# Creating a softlink for the application
ln -s ${INSTALL_PATH} ${SOFT_LINK_PATH}

# TODO: This currently does not work. Needs to be fixed
# Copying slapd.conf file
cp -r -p slapd.conf ${INSTALL_PATH}/etc/openldap

# Creating the config db directory
mkdir ${INSTALL_PATH}/etc/openldap/slapd.d

# Creating the run directory
mkdir ${INSTALL_PATH}/run

# Creating the data db directory
mkdir /data/openldap

# Cleanup
rm -rf /tmp/openldap-${VERSION}*