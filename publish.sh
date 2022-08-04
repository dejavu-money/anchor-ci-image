echo "$DOCKER_PASSWORD" | docker login --username $DOCKER_USERNAME --password-stdin
docker build . -t $DOCKER_HUB_REPO:$DOCKER_TAG_VERSION
docker push $DOCKER_HUB_REPO:$DOCKER_TAG_VERSION
