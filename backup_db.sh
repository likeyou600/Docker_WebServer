CONTAINER=XXXXX
DB_NAME=XXXXX
FILENAME=/db_backup/${DB_NAME}_$(date "+%Y%m%d_%H%M%S").dump
if [ ! -d "/db_backup" ]; then
    mkdir -p "/db_backup"
fi

docker exec ${CONTAINER} sh -c "mysqldump -u root ${DB_NAME}" > ${FILENAME}
