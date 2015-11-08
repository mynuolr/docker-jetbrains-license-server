#!/bin/bash

set -e

if [[ -d ${LCSRV_HOME}/overlay ]]
then
	cp -afv ${LCSRV_HOME}/overlay/. ${LCSRV_INSTALL}/
fi

if [[ ! -e ${LCSRV_HOME}/conf/service-config.properties ]]
then
	${LCSRV_INSTALL}/bin/license-server.sh configure \
		--listen 0.0.0.0 \
		--port 1111 \
		--base-url ${LCSRV_BASE_URL} \
		--logs-dir ${LCSRV_HOME}/logs \
		--temp-dir ${LCSRV_HOME}/temp
fi

exec ${LCSRV_INSTALL}/bin/license-server.sh run
