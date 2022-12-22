#!/bin/sh

MAVEN_OPTS='-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn'
BASEDIR=$( readlink -f "$( dirname "$0" )" )

export MAVEN_OPTS

"${BASEDIR}"/site-build.sh
mvn "${@}" --batch-mode --non-recursive com.github.github:site-maven-plugin:site@gh-pages-deploy
