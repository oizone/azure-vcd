#!/bin/bash

eth0IP=$(ip addr list dev eth0|grep "inet "|cut -d "/" -f 1|cut -d " " -f 6)
eth1IP=$(ip addr list dev eth1|grep "inet "|cut -d "/" -f 1|cut -d " " -f 6)

curl -o /tmp/vcd.bin -X GET -H "x-ms-date: $(date -u)" "$VCDMEDIAURL?$REPOTOKEN"
echo "$VCDMEDIAURL?$REPOTOKEN" > /tmp/url
echo $(VCDMEDIAURL) > /tmp/url1
echo $(REPOTOKEN) > /tmp/url2
set > /tmp/setti
env > /tmp/env

echo $0 > /tmp/para
echo $1 >> /tmp/para
echo $2 >> /tmp/para
echo $3 >> /tmp/para
echo $4 >> /tmp/para
echo $5 >> /tmp/para


#/tmp/vcd.bin -ip $eth0IP -cons $eth1IP -dbtype postgres -dbhost $DBNAME.postgres.database.azure.com -dbname vcloud -dbuser vcloud@$DBNAME --enable-ceip false -dbpassword $DBPWD -k /tmp/certificate.ks -w $CERTPWD  -unattended

#/opt/vmware/vcloud-director/bin/cell-management-tool system-setup --user $VCDUSER --full-name "VCD System Administrator" --email $VCDEMAIL --system-name `hostname` --installation-id 2 -password $VCDPWD --unattended
