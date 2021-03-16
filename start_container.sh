#!/bin/bash
CONTAINER_HOME=$(cd $(dirname $0); pwd)
IMAGE="${CONTAINER_HOME}/elasticsearch.sif"
INSTANCE="elasticsearch"

if [ ! -e ${CONTAINER_HOME}/elasticsearch_logs ]; then
    mkdir ${CONTAINER_HOME}/elasticsearch_logs
fi

if [ ! -e ${CONTAINER_HOME}/elasticsearch_data ]; then
    mkdir ${CONTAINER_HOME}/elasticsearch_data
fi

if [ ! -e ${CONTAINER_HOME}/elasticsearch_config ]; then
    mkdir ${CONTAINER_HOME}/elasticsearch_config
    singularity exec ${IMAGE} cp /opt/elasticsearch/config/* ${CONTAINER_HOME}/elasticsearch_config/
fi

if [ ! -e ${CONTAINER_HOME}/kibana_data ]; then
    mkdir ${CONTAINER_HOME}/kibana_data
fi

singularity instance start \
-B ${CONTAINER_HOME}/elasticsearch_logs:/opt/elasticsearch/logs \
-B ${CONTAINER_HOME}/elasticsearch_data:/opt/elasticsearch/data \
-B ${CONTAINER_HOME}/elasticsearch_config:/opt/elasticsearch/config \
-B ${CONTAINER_HOME}/kibana_data:/opt/kibana/data \
${IMAGE} \
${INSTANCE}

singularity exec instance://${INSTANCE} elasticsearch -d
singularity exec instance://${INSTANCE} kibana -l /opt/kibana/data/kibana.log &
