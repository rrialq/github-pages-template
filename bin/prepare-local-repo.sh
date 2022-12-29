#!/bin/sh
BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
EXTENSION_LIB_PATH=${TARGET_PATH}/ext-lib

JAVA_GALICIAN_FILENAME="${EXTENSION_LIB_PATH}/javagalician-java6.jar"

if [ ! -d ${EXTENSION_LIB_PATH} ]; then
    mkdir -p ${EXTENSION_LIB_PATH}
fi

if [ ! -f ${JAVA_GALICIAN_FILENAME} ]; then
    wget --quiet -O ${JAVA_GALICIAN_FILENAME} https://github.com/javagalician/javagalician-java6/releases/download/javagalician-java6-1.1/javagalician-java6-1.1.jar \
    && mvn install:install-file -Dfile=${JAVA_GALICIAN_FILENAME} -DgroupId=org.javagalician -DartifactId=javagalician-java6 -Dversion=1.1 -Dpackaging=jar
fi
