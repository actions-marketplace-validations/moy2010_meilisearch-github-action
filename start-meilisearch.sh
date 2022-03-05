#!/bin/sh

# Map input values from the GitHub Actions workflow to shell variables
MEILISEARCH_VERSION=$1
MEILISEARCH_PORT=$2
MEILISEARCH_API_KEY=$3

echo "::group::Starting Meilisearch server"
echo "  - port [$MEILISEARCH_PORT]"
echo "  - version [$MEILISEARCH_VERSION]"
echo "  - api key [$MEILISEARCH_API_KEY]"
echo ""

docker run --name meilisearch --publish $MEILISEARCH_PORT:$MEILISEARCH_PORT --detach --volume -e MEILI_MASTER_KEY=$MEILISEARCH_API_KEY "$(pwd)/data.ms:/data.ms" getmeili/meilisearch:$MEILISEARCH_VERSION
echo "::endgroup::"
