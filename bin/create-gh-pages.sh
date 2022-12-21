#!/bin/sh

BASEDIR=$( dirname "$0" )
TARGET_PATH=${BASEDIR}/target
STAGING_PATH=${TARGET_PATH}/staging
GH_PAGES_PATH=${TARGET_PATH}/gh-pages
PROJECT_VERSION_FILE=${TARGET_PATH}/project.version

[ -d ${GH_PAGES_PATH} ] && rm -Rf ${GH_PAGES_PATH}

[ ! -d ${GH_PAGES_PATH} ] && mkdir -p ${GH_PAGES_PATH}
if [ ! -d ${STAGING_PATH} ]; then
    echo 'Generating site'
    mvn -q site site:stage
fi

mvn -q help:evaluate -Dexpression='project.version' -DforceStdout -Doutput=${PROJECT_VERSION_FILE}
PROJECT_VERSION=$( cat ${PROJECT_VERSION_FILE} )

echo PROJECT_VERSION = ${PROJECT_VERSION}
cp src/main/resources/* ${GH_PAGES_PATH}
cp -R ${STAGING_PATH} ${GH_PAGES_PATH}/${PROJECT_VERSION}
