#!/bin/sh
# $1 = Target file
# $2 = URL
downloadExtensionLib() {
    if [ ! -f "${1}" ]; then
        sudo wget --quiet -O "${EXTENSION_LIB_PATH}/${1}" "${2}" \
        && echo "[  OK   ] Downloading ${1}" \
        || echo "[ ERROR ] Downloading ${1}"
    fi
}

BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
EXTENSION_LIB_PATH=/usr/java/packages/lib/ext

if [ ! -d ${EXTENSION_LIB_PATH} ]; then
    sudo mkdir -p "${EXTENSION_LIB_PATH}"
fi

downloadExtensionLib "javagalician-java6.jar" "https://github.com/javagalician/javagalician-java6/releases/download/javagalician-java6-1.1/javagalician-java6-1.1.jar"
