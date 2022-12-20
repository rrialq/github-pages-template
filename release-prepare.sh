#!/bin/sh

mvn release:prepare \
  -DdevelopmentVersion=1.0-SNAPSHOT \
  -DreleaseVersion=1.0.0-rc0 \
  -DinteractiveMode=true
