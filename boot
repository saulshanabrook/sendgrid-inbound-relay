#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

exec gunicorn -b 0.0.0.0:${PORT} --access-logfile=- --error-logfile=- email_relay:app
