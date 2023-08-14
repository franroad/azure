
Conection name: test-policy-356412:us-central1:fran-sql

1- create the database /sql , set the root pass

2- create a folder where the params of the conexion will be sotred (/home/franciscobe/cloudsql) to then use the mysql command to connect to it

2-Download cloud sql auth proxy. and configure gcloud cli and gcloud init and mysql agent

curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.6.0/cloud-sql-proxy.linux.amd64

chmod +x cloud-sql-proxy

3- creamos la service account y le generamos una key nos la bajamos en json format


4- conifure the params for the tool to run using unix sockets: the required info will be saved
in the folder that later will be used by the client:


./cloud-sql-proxy --unix-socket /home/franciscobe/cloudsql --credentials-file ./test-policy-356412-12dde9f74ec7.json test-policy-356412:us-central1:fran-sql


gcloud sql instances describe test-policy-356412:us-central1:fran-sql

5- en la carpeta que hemos creado (sql) se hahabra creado un string debemos usarlo para la conexion:
nos pedira la pass que hemos metido para root al crear la db

mysql -u root -p -S /home/franciscobe/cloudsql/test-policy-356412:us-central1:fran-sql

