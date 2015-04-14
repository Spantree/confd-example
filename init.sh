#!/usr/bin/env bash

set -o errexit
set -o xtrace

confd -onetime -backend env

cat /bi-data.properties

exec "$@"
