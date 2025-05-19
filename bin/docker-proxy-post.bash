#!/bin/bash
. constants
printf "$YELLOW[$(date)] Waiting for ProxySQL service to initialize"
RC=1
while [ $RC -eq 1 ]
do
  sleep 1
  printf "."
  mysqladmin ping -h127.0.0.1 -P16032 -uradmin -pradmin  > /dev/null 2>&1
  RC=$?
done
printf "$LIME_YELLOW\n"

printf "$POWDER_BLUE[$(date)] Configuring ProxySQL on proxysql1...$LIME_YELLOW\n"
mysql -uradmin -pradmin -h127.0.0.1 -P16032 < $(pwd)/conf/proxysql/config.sql

printf "$POWDER_BLUE[$(date)] Configuring ProxySQL Cluster on proxysql1...$LIME_YELLOW\n"
mysql -uradmin -pradmin -h127.0.0.1 -P16032 < $(pwd)/conf/proxysql/cluster.sql

printf "$POWDER_BLUE[$(date)] Configuring ProxySQL Cluster on proxysql2...$LIME_YELLOW\n"
mysql -uradmin -pradmin -h127.0.0.1 -P26032 < $(pwd)/conf/proxysql/cluster.sql

printf "$POWDER_BLUE[$(date)] Configuring ProxySQL Cluster on proxysql3...$LIME_YELLOW\n"
mysql -uradmin -pradmin -h127.0.0.1 -P36032 < $(pwd)/conf/proxysql/cluster.sql
