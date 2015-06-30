#!/bin/bash

# Config vars broken out here:
source ./JVMParameters.conf.sh

java ${CONFIG_OPTS} -jar forge-1.7.10-10.13.3.1401-1710ls-universal.jar nogui
