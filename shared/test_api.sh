#!/bin/bash

curl -X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"description":"rancher master account key", "name":"MasterAccountKey"}' \
'http://localhost:8080/v1/apikeys' \
| jq '.' > /vagrant/shared/apikey.json

CATTLE_ACCESS_KEY=`cat /vagrant/shared/apikey.json | jq ".publicValue"`
CATTLE_SECRET_KEY=`cat /vagrant/shared/apikey.json | jq ".secretValue"`

echo "" >> /home/vagrant/.bashrc
echo "export CATTLE_ACCESS_KEY=${CATTLE_ACCESS_KEY}" >> /home/vagrant/.bashrc
echo "export CATTLE_SECRET_KEY=${CATTLE_SECRET_KEY}" >> /home/vagrant/.bashrc
echo "" >> /home/vagrant/.bashrc

curl -X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"accessMode":"unrestricted", "enabled":true, "name":"admin", "password":"admin", "username":"admin"}' \
'http://localhost:8080/v1/localauthconfigs' \
| jq '.' > /vagrant/shared/localauthconfigs.json
