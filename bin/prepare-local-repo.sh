#!/bin/sh
BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
EXTENSION_LIB_PATH=/usr/java/packages/lib/ext

JAVA_GALICIAN_FILENAME="${EXTENSION_LIB_PATH}/javagalician-java6.jar"

if [ ! -d ${EXTENSION_LIB_PATH} ]; then
    sudo mkdir -p ${EXTENSION_LIB_PATH}
    sudo cp -r ${JAVA_HOME}/jre/lib/ext/* ${EXTENSION_LIB_PATH}
fi

if [ ! -f ${JAVA_GALICIAN_FILENAME} ]; then
    sudo wget --quiet -O ${JAVA_GALICIAN_FILENAME} https://github.com/javagalician/javagalician-java6/releases/download/javagalician-java6-1.1/javagalician-java6-1.1.jar
fi

echo -------------
echo java.ext.dirs
echo -------------

mvn help:evaluate -Dexpression=java.ext.dirs
