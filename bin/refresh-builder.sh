#!/bin/sh

LOCAL_PROJ=~/Documents/workspace/OpenTripPlanner

cp -n ./lib/graph-builder.jar ./lib/graph-builder.jar.orig
cp $LOCAL_PROJ/opentripplanner-graph-builder/target/graph-builder.jar ./lib/.
