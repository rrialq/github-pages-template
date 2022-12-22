#!/bin/sh

BASEDIR=$( dirname "$0" )
"${BASEDIR}"/site-build.sh
mvn "${@}" --non-recursive com.github.github:site-maven-plugin:site@gh-pages-deploy
