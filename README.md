mysql-db-backup
===============

Back up your MySQL databases

The script create a (date-formatted named) directory with one tar file for each database. 

It takes 4 arguments: Database user, user password, directory where the backup will be created (optional), date format to name the backup directory (optional).

Example: 

`
$ ./mysql_db_backup.sh database_user password /home/user/database-backups "%y-%m-%d"
`

To run the script you have to set it execution permissions, in Linux: 

`
chmod +x mysql_db_backup.sh
`


> Instructions come soon...
