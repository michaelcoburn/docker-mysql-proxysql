SET admin-cluster_username='radmin';
SET admin-cluster_password='radmin';
LOAD ADMIN VARIABLES TO RUNTIME;
SAVE ADMIN VARIABLES TO DISK;
DELETE FROM proxysql_servers;
INSERT INTO proxysql_servers (hostname,comment) VALUES ('proxysql1','1st node');
LOAD PROXYSQL SERVERS TO RUNTIME;
SAVE PROXYSQL SERVERS TO DISK;

