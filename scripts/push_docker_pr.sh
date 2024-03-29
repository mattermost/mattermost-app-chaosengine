#!/bin/bash

# Copyright (c) 2015-present Mattermost, Inc. All Rights Reserved.
# See LICENSE.txt for license information.

set -e
set -u

export TAG="${CIRCLE_SHA1:0:7}"

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

docker tag mattermost/mattermost-app-chaosengine:test mattermost/mattermost-app-chaosengine:$TAG

docker push mattermost/mattermost-app-chaosengine:$TAG
