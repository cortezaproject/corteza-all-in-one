# Corteza ALL-IN-ONE Dockerfile

## BUILD:
```bash
docker build -t corteza/all-in-one
```

## RUN:
```bash
API=90
HOST="example.com"
PERCONA='corteza:change-me@tcp(example.com:3306)/corteza?collation=utf8mb4_general_ci'
SPA=93

docker run \
    -it \
    --rm \
    -p ${API}:80 \
    -e LOCAL_DEMO_API_PORT=${API} \
    -p ${SPA}:${SPA} \
    -e LOCAL_DEMO_SPA_PORT=${SPA} \
    -e HOSTADDR=${HOST} \
    -e DB_DSN=${PERCONA} \
    corteza/all-in-one
```
