docker run -d \
  --name mydb \
  --net blue \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  -v vipvol:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=secret \
  -p 5432:5432 \
  postgres

docker exec mydb psql -U postgres postgres -c 'select * from vip'

PGPASSWORD=secret psql -U postgres postgres -h localhost -p 5432 -c 'select * from vip;'

## front end queries db:
PGPASSWORD=secret psql -U postgres -h db -c 'select * from vip;'


## Network

docker network create blue

docker run --name front --net=blue  -it cmd.cat/bash/dig/curl/psql