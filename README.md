# Corteza ALL-IN-ONE Dockerfile

WIP, right now you can use it this way:

Let's say we have:

* percona container on network 'TEST'  and
* we host it on 387338.xyz,

```bash
API=90
HOST="387338.xyz"
PERCONA='corteza:change-me@tcp(percona:3306)/corteza?collation=utf8mb4_general_ci'
SPA=93

docker run \
    -it \
    --rm \
    -p ${API}:80 \
    -e LOCAL_DEMO_API_PORT=${API} \
    -p ${SPA}:${SPA} \
    -e LOCAL_DEMO_SPA_PORT=${SPA} \
    -e HOSTADDR=${HOST} \
    --network TEST \
    -e DB_DSN=${PERCONA} \
    cbuctok/xx
```
