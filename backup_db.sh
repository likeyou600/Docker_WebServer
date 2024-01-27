CONTAINER=docker_webserver-db-1
DB_NAME=XXXXX
FILENAME=/home/Docker_WebServer/db_backup/${DB_NAME}_$(date "+%Y%m%d_%H%M%S").sql
if [ ! -d "/home/Docker_WebServer/db_backup" ]; then
    mkdir -p "/home/Docker_WebServer/db_backup"
fi

docker exec ${CONTAINER} sh -c "mariadb-dump -u XXXXX -pXXXXX  --skip-add-locks ${DB_NAME}" > ${FILENAME}
