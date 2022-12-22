#!/bin/sh

BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
SITE_PATH=${TARGET_PATH}/site
STAGING_PATH=${TARGET_PATH}/staging
GH_PAGES_PATH=${TARGET_PATH}/gh-pages
PROJECT_VERSION_FILE=${TARGET_PATH}/project.version

if [ ! -d "${SITE_PATH}" ]; then
    echo 'Xerando o site'
    mvn -q site
fi

if [ ! -d "${STAGING_PATH}" ]; then
    echo 'Generating staging'
    mkdir -p "${STAGING_PATH}"
    mvn -q site:stage
fi

mvn -q help:evaluate -D'expression=project.version' -DforceStdout -D"output=${PROJECT_VERSION_FILE}"
PROJECT_VERSION=$( cat "${PROJECT_VERSION_FILE}" )
echo PROJECT_VERSION = "${PROJECT_VERSION}"

cp -R "${STAGING_PATH}" "${GH_PAGES_PATH}/${PROJECT_VERSION}"
