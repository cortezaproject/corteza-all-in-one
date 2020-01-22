#!/bin/bash

API=90
SPA=93

docker run \
    -it \
    --rm \
    --network TEST \
    -p ${API}:80 \
    -e LOCAL_DEMO_API_PORT=${API} \
    -p ${SPA}:${SPA} \
    -e LOCAL_DEMO_SPA_PORT=${SPA} \
    -e DB_DSN='corteza:change-me@tcp(percona:3306)/corteza?collation=utf8mb4_general_ci' \
    -e HOSTADDR="387338.xyz" \
    cbuctok/xx $1
