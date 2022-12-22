#!/bin/sh

BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
GH_PAGES_PATH=${TARGET_PATH}/gh-pages
SITE_PATH=${TARGET_PATH}/site
STAGING_PATH=${TARGET_PATH}/staging

echo "Borrando directorios 'target/gh-pages', 'target/site' e 'target/staging'"
[ -d "${GH_PAGES_PATH}" ] && rm -Rf "${GH_PAGES_PATH}"
[ -d "${SITE_PATH}" ] && rm -Rf "${SITE_PATH}"
[ -d "${STAGING_PATH}" ] && rm -Rf "${STAGING_PATH}"

echo 'Xerando gh-pages'
mvn site site:stage && mvn post-site
