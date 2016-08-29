This is docker based Centralized Logging Solution.

How to use it:
Pre-requisites
Docker and Docker Compose installed and runing on Centralized Logging Server and all agent nodes ( where you want to collect logs from)

Step 01
Clone repo.

Step 02
Open cls/docker-compose.yml file

Provide absolute path where you need to store Elasticsearch data.
By default it is /var/cls_logs_storage/esdata

...
  es:
    image: clselasticsearch:0.1
    volumes:
    - /var/cls_logs_storage/esdata:/usr/share/elasticsearch/data
...

Provide port for redis container.
By default it is 7009.

...
  redis:
    image: redis
    ports:
    - "7009:6379"
...

Provide port for Kibana. This is the port End Users would interact with.
By default, it is 7008.
...
  Kibana:
    image: kibana
    ports:
    - "7008:5601"
...

Step 03
Building Images
Navigate to cls directory.
Run build_images.sh script.

Step 04
Run Central Server
Navigate to cls.
Run command:  sudo docker-compose up -d

Step 05
Confirm Server is up and running
	1. Verify all container are running fine
Kibana, redis, es, and IndexerLogstash
	2. Hit Logstash Server on port (kibana container port by default 7008)

Steps to Configure Agent
navigate to cls_agent directory

Update docker-compose.yml file by providing absolute path to logs directory

Update cls_agent/config-dir/shipper.conf by providing Central Server IP, port and log type in agent logstash config file

Build Image
execute buildimage.sh file

Run agent
docker-compose up -d

