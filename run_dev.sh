#!/bin/bash

DEV_APPSERVER=`which dev_appserver.py`
PORT=8080
LOG_LEVEL=debug
SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! -f ./datastore.db ]; then
    # Install default datastore
    cp orig_datastore.db datastore.db
    chmod 777 datastore.db
fi

${DEV_APPSERVER} --datastore_path=datastore.db \
                 --log_level=${LOG_LEVEL} \
                 --host=0.0.0.0 \
                 --port=${PORT} \
                 --application=sandbox-2501 \
                 app.yaml
