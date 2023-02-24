now=`date +"%Y_%m_%d-%H_%M_%S"`
pg_dump --host localhost --port 5432 --user anos prisma_fun > ./prisma/backups/${now}_backup.sql