#!/bin/bash
set -e
DEBUG=True
REDIS_HOST=127.0.0.1
REDIS_PORT=16379
NEBULA_HOST=127.0.0.1
NEBULA_PORT=9001

SOURCES=kafka

#kafka driver
BOOTSTRAP_SERVERS=127.0.0.1:9092
TOPICS=nebula_nginx_lua
GROUP_ID=nebula

CODE_PATH=/Users/akaka/my_github/sniffer/nebula_sniffer

###########global############
sed -i "" "s/>DEBUG</$DEBUG/" $CODE_PATH/settings.py
sed -i "" "s/>REDIS_HOST</$REDIS_HOST/"  $CODE_PATH/conf/*.conf
sed -i "" "s/>REDIS_PORT</$REDIS_PORT/"  $CODE_PATH/conf/*.conf
sed -i "" "s/>NEBULA_HOST</$NEBULA_HOST/"  $CODE_PATH/conf/*.conf
sed -i "" "s/>NEBULA_PORT</$NEBULA_PORT/"  $CODE_PATH/conf/*.conf

###########drivers############
##SOURCES
sed -i "" "s/>SOURCES</$SOURCES/"  $CODE_PATH/conf/sniffer.conf

##default
sed -i "" "s/>DRIVER_INTERFACE</$DRIVER_INTERFACE/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>DRIVER_PORT</$DRIVER_PORT/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>BRO_PORT</$BRO_PORT/" $CODE_PATH/conf/sniffer.conf

##logstash
sed -i "" "s/>LOGSTASH_PORT</$LOGSTASH_PORT/" $CODE_PATH/conf/sniffer.conf

##kafka
sed -i "" "s/>TOPICS</$TOPICS/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>GROUP_ID</$GROUP_ID/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>BOOTSTRAP_SERVERS</$BOOTSTRAP_SERVERS/" $CODE_PATH/conf/sniffer.conf

##rabbitmq
sed -i "" "s/>AMQP_URL</$AMQP_URLT/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>AMQP_QUEUE_NAME</$AMQP_QUEUE_NAME/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>AMQP_EXCHANGE_NAME</$AMQP_EXCHANGE_NAME/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>AMQP_EXCHANGE_TYPE</$AMQP_EXCHANGE_TYPE/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>AMQP_DURABLE</$AMQP_DURABLE/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>AMQP_ROUTING_KEY</$AMQP_ROUTING_KEY/" $CODE_PATH/conf/sniffer.conf

##redislist
sed -i "" "s/>REDIS_HOST</$REDIS_HOST/" $CODE_PATH/conf/sniffer.conf
sed -i "" "s/>REDIS_PORT</$REDIS_PORT/" $CODE_PATH/conf/sniffer.conf

##syslog
sed -i "" "s/>SYSLOG_PORT</$SYSLOG_PORT/" $CODE_PATH/conf/sniffer.conf


exec "$@"
