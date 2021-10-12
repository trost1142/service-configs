#!/bin/sh

service zookeeper start 

service apache2 start

service kafka start

sleep 5

/etc/kafka/kafka/bin/kafka-topics.sh --create --topic postback.delivery --zookeeper localhost:2181 --partitions 1 --replication-factor 1 --config retention.ms=60000

service delivery-agent start

/bin/bash
