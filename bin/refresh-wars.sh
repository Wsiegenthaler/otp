#!/bin/sh

find ~/Documents/workspace/OpenTripPlanner/ | grep \.war$ | egrep -v 'api-extended|x' | xargs -I ? cp ? webapps/.
