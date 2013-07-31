#!/bin/bash

user=$1
password=$2
directory=$3

connection="mysql -u$user -p$password"
dbquery=$($connection -e "SHOW DATABASES;")

db=( $( for dbname in $dbquery ; do echo $dbname ; done ) )

cd $directory
backup_name=$(date +%Y-%m-%d)
mkdir $backup_name
cd $backup_name
echo $backup_name

for dbname in ${db[@]}; do
    if [[ "$dbname" != "Database" && \
	  "$dbname" != "information_schema" && \
	  "$dbname" != "mysql" && \
	  "$dbname" != "performance_schema" ]]; then
        mysqldump -u$user -p$password --opt $dbname > $dbname.sql
	tar -zcvf $dbname.tgz $dbname.sql
        rm -f $dbname.sql
    fi
done
