CONTAINER=XXXXX
DB_NAME=XXXXX
FILENAME=/db_backup/${DB_NAME}_$(date "+%Y%m%d_%H%M%S").sql
if [ ! -d "/db_backup" ]; then
    mkdir -p "/db_backup"
fi

docker exec ${CONTAINER} sh -c "mysqldump --user=XXXXX --password=XXXXX --skip-add-locks ${DB_NAME}" > ${FILENAME}
