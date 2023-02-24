now=`date +"%m_%d_%Y"`
pg_dump --host localhost --port 5432 --user anos prisma_fun > ./prisma/backups/${now}_backup.sql