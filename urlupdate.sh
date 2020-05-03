#!/bin/bash

echo {\"type\" : \"application/vnd.vmware.admin.generalSettings+json\",\"absoluteSessionTimeoutMinutes\" : 1440,\"consoleProxyExternalAddress\" : \"###CONSOLE###\",\"hostCheckDelayInSeconds\" : 300,\"hostCheckTimeoutSeconds\" : 30,\"syslogServerSettings\" : {\"syslogServerIp1\" : null,\"syslogServerIp2\" : null },\"restApiBaseHttpUri\" : \"http://###PORTAL###\",\"restApiBaseUri\" : \"https://###PORTAL###\",\"sessionTimeoutMinutes\" : 30,\"syncIntervalInHours\" : 24,\"tenantPortalExternalHttpAddress\" : \"http://###PORTAL###\",\"tenantPortalExternalAddress\" : \"https://###PORTAL###\"} > url.json

sed 's/###CONSOLE###/'$VCDCONSOLEURL'/' < url.json > url.json.2
sed 's/###PORTAL###/'$VCDURL'/g' < url.json.2 > url.json

eth0IP=$(ip addr list dev eth0|grep "inet "|cut -d "/" -f 1|cut -d " " -f 6)

AUTH=`curl -I --insecure -k -H "Accept:application/*+xml;version=34.0" -u $VCDUSER@system:$VCDPWD -X POST https://$eth0IP/api/sessions|grep "x-vcloud-authorization"|sed -e 's/^\(.\{56\}\).*/\1/'`
echo $AUTH
curl -w --insecure -k -H "Accept:application/*+json;version=34.0" -H "$AUTH" -H "Content-Type:application/*+json" -X PUT --data-ascii @url.json https://$eth0IP/api/admin/extension/settings/general

