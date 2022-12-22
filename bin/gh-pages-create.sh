#!/bin/sh

MAVEN_OPTS='-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn'
BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
GH_PAGES_PATH=${TARGET_PATH}/gh-pages
SITE_PATH=${TARGET_PATH}/site
STAGING_PATH=${TARGET_PATH}/staging

export MAVEN_OPTS

echo "Borrando directorios 'target/gh-pages', 'target/site' e 'target/staging'"
[ -d "${GH_PAGES_PATH}" ] && rm -Rf "${GH_PAGES_PATH}"
[ -d "${SITE_PATH}" ] && rm -Rf "${SITE_PATH}"
[ -d "${STAGING_PATH}" ] && rm -Rf "${STAGING_PATH}"

echo 'Xerando target/site'
mvn --batch-mode site site:stage
echo ''
echo 'Xerando target/gh-pages'
mvn --batch-mode post-site
