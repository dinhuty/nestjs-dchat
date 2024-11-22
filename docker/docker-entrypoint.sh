#!/bin/sh
# Exit on fail
set -e

npm i && npm run dev

# Finally call command issued to the docker service
exec "$@"
