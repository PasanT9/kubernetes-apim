#!/bin/bash
oc project wso2

# service account
oc create serviceaccount wso2svcacct
oc adm policy add-scc-to-user anyuid -z wso2svcacct -n default

# volumes
oc create -f volumes/persistent-volumes.yaml

# Configuration Maps
oc create configmap apim-analytics-1-bin --from-file=../confs/apim-analytics-1/bin/
oc create configmap apim-analytics-1-conf --from-file=../confs/apim-analytics-1/repository/conf/
oc create configmap apim-analytics-1-spark --from-file=../confs/apim-analytics-1/repository/conf/analytics/spark/
oc create configmap apim-analytics-1-axis2 --from-file=../confs/apim-analytics-1/repository/conf/axis2/
oc create configmap apim-analytics-1-datasources --from-file=../confs/apim-analytics-1/repository/conf/datasources/
oc create configmap apim-analytics-1-tomcat --from-file=../confs/apim-analytics-1/repository/conf/tomcat/
oc create configmap apim-analytics-1-security --from-file=../confs/apim-analytics-1/repository/resources/security/

oc create configmap apim-analytics-2-bin --from-file=../confs/apim-analytics-1/bin/
oc create configmap apim-analytics-2-conf --from-file=../confs/apim-analytics-1/repository/conf/
oc create configmap apim-analytics-2-spark --from-file=../confs/apim-analytics-1/repository/conf/analytics/spark/
oc create configmap apim-analytics-2-axis2 --from-file=../confs/apim-analytics-1/repository/conf/axis2/
oc create configmap apim-analytics-2-datasources --from-file=../confs/apim-analytics-1/repository/conf/datasources/
oc create configmap apim-analytics-2-tomcat --from-file=../confs/apim-analytics-1/repository/conf/tomcat/
oc create configmap apim-analytics-2-security --from-file=../confs/apim-analytics-1/repository/resources/security/

oc create configmap apim-gw-manager-worker-bin --from-file=../confs/apim-gw-manager-worker/bin/
oc create configmap apim-gw-manager-worker-conf --from-file=../confs/apim-gw-manager-worker/repository/conf/
oc create configmap apim-gw-manager-worker-identity --from-file=../confs/apim-gw-manager-worker/repository/conf/identity/
oc create configmap apim-gw-manager-worker-axis2 --from-file=../confs/apim-gw-manager-worker/repository/conf/axis2/
oc create configmap apim-gw-manager-worker-datasources --from-file=../confs/apim-gw-manager-worker/repository/conf/datasources/
oc create configmap apim-gw-manager-worker-tomcat --from-file=../confs/apim-gw-manager-worker/repository/conf/tomcat/
oc create configmap apim-gw-manager-worker-resources-security --from-file=../confs/apim-gw-manager-worker/repository/resources/security/

oc create configmap apim-gw-worker-bin --from-file=../confs/apim-gw-worker/bin/
oc create configmap apim-gw-worker-conf --from-file=../confs/apim-gw-worker/repository/conf/
oc create configmap apim-gw-worker-identity --from-file=../confs/apim-gw-worker/repository/conf/identity/
oc create configmap apim-gw-worker-axis2 --from-file=../confs/apim-gw-worker/repository/conf/axis2/
oc create configmap apim-gw-worker-datasources --from-file=../confs/apim-gw-worker/repository/conf/datasources/
oc create configmap apim-gw-worker-tomcat --from-file=../confs/apim-gw-worker/repository/conf/tomcat/
oc create configmap apim-gw-worker-resources-security --from-file=../confs/apim-gw-worker/repository/resources/security/

oc create configmap apim-km-bin --from-file=../confs/apim-km/bin/
oc create configmap apim-km-conf --from-file=../confs/apim-km/repository/conf/
oc create configmap apim-km-identity --from-file=../confs/apim-km/repository/conf/identity/
oc create configmap apim-km-axis2 --from-file=../confs/apim-km/repository/conf/axis2/
oc create configmap apim-km-datasources --from-file=../confs/apim-km/repository/conf/datasources/
oc create configmap apim-km-tomcat --from-file=../confs/apim-km/repository/conf/tomcat/
oc create configmap apim-km-resources-security --from-file=../confs/apim-km/repository/resources/security/

oc create configmap apim-pubstore-tm-1-bin --from-file=../confs/apim-pubstore-tm-1/bin/
oc create configmap apim-pubstore-tm-1-conf --from-file=../confs/apim-pubstore-tm-1/repository/conf/
oc create configmap apim-pubstore-tm-1-identity --from-file=../confs/apim-pubstore-tm-1/repository/conf/identity/
oc create configmap apim-pubstore-tm-1-axis2 --from-file=../confs/apim-pubstore-tm-1/repository/conf/axis2/
oc create configmap apim-pubstore-tm-1-datasources --from-file=../confs/apim-pubstore-tm-1/repository/conf/datasources/
oc create configmap apim-pubstore-tm-1-tomcat --from-file=../confs/apim-pubstore-tm-1/repository/conf/tomcat/
oc create configmap apim-pubstore-tm-1-resources-security --from-file=../confs/apim-pubstore-tm-1/repository/resources/security/

oc create configmap apim-pubstore-tm-2-bin --from-file=../confs/apim-pubstore-tm-2/bin/
oc create configmap apim-pubstore-tm-2-conf --from-file=../confs/apim-pubstore-tm-2/repository/conf/
oc create configmap apim-pubstore-tm-2-identity --from-file=../confs/apim-pubstore-tm-2/repository/conf/identity/
oc create configmap apim-pubstore-tm-2-axis2 --from-file=../confs/apim-pubstore-tm-2/repository/conf/axis2/
oc create configmap apim-pubstore-tm-2-datasources --from-file=../confs/apim-pubstore-tm-2/repository/conf/datasources/
oc create configmap apim-pubstore-tm-2-tomcat --from-file=../confs/apim-pubstore-tm-2/repository/conf/tomcat/
oc create configmap apim-pubstore-tm-2-resources-security --from-file=../confs/apim-pubstore-tm-2/repository/resources/security/

# databases
echo 'deploying databases ...'
oc create -f rdbms/rdbms-persistent-volume-claim.yaml
oc create -f rdbms/rdbms-service.yaml
oc create -f rdbms/rdbms-deployment.yaml

echo 'deploying services and volume claims ...'
oc create -f apim-analytics/wso2apim-analytics-service.yaml
oc create -f apim-analytics/wso2apim-analytics-1-service.yaml
oc create -f apim-analytics/wso2apim-analytics-2-service.yaml

oc create -f apim-pubstore-tm/wso2apim-service.yaml
oc create -f apim-pubstore-tm/wso2apim-pubstore-tm-1-service.yaml
oc create -f apim-pubstore-tm/wso2apim-pubstore-tm-2-service.yaml

oc create -f apim-gateway/wso2apim-worker-service.yaml
oc create -f apim-gateway/wso2apim-sv-service.yaml
oc create -f apim-gateway/wso2apim-pt-service.yaml
oc create -f apim-gateway/wso2apim-manager-worker-service.yaml

oc create -f apim-km/wso2apim-km-service.yaml
oc create -f apim-km/wso2apim-key-manager-service.yaml

oc create -f apim-pubstore-tm/wso2apim-tm1-volume-claim.yaml
oc create -f apim-pubstore-tm/wso2apim-tm2-volume-claim.yaml
oc create -f apim-gateway/wso2apim-mgt-volume-claim.yaml
oc create -f apim-gateway/wso2apim-worker-volume-claim.yaml

sleep 30s
# analytics
echo 'deploying apim analytics ...'
oc create -f apim-analytics/wso2apim-analytics-1-deployment.yaml
sleep 10s
oc create -f apim-analytics/wso2apim-analytics-2-deployment.yaml

sleep 1m
echo 'deploying apim pubstore-tm-1 ...'
oc create -f apim-pubstore-tm/wso2apim-pubstore-tm-1-deployment.yaml

sleep 1m
echo 'deploying apim pubstore-tm-2 ...'
oc create -f apim-pubstore-tm/wso2apim-pubstore-tm-2-deployment.yaml

sleep 30s
echo 'deploying apim key manager...'
oc create -f apim-km/wso2apim-km-deployment.yaml

sleep 30s
echo 'deploying apim manager-worker ...'
oc create -f apim-gateway/wso2apim-manager-worker-deployment.yaml
sleep 30s
echo 'deploying apim worker ...'
oc create -f apim-gateway/wso2apim-worker-deployment.yaml

echo 'deploying wso2apim and wso2apim-analytics routes ...'
oc create -f routes/wso2apim-route.yaml
oc create -f routes/wso2apim-gw-route.yaml
oc create -f routes/wso2apim-analytics-route.yaml