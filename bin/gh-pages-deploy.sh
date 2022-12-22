#!/bin/sh

MAVEN_OPTS='-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn'
BASEDIR=$( readlink -f "$( dirname "$0" )" )
TARGET_PATH=$( readlink -f "${BASEDIR}/../target" )
GH_PAGES_PATH=${TARGET_PATH}/gh-pages

if [ -d "${GH_PAGES_PATH}" ]; then
  export MAVEN_OPTS

  mvn --errors --batch-mode --show-version --non-recursive com.github.github:site-maven-plugin:site@gh-pages-deploy
else
  echo '[ERROR] Non se xerou gh-pages.'
  echo '        Execute bin/gh-pages-create.sh antes de executar este script.'
  exit 1
fi
