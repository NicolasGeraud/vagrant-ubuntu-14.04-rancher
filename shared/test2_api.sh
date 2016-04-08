#!/bin/bash

curl 'http://localhost:8080'
echo "status = $?"


curl --connect-timeout 10 \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"description":"rancher master account key", "name":"MasterAccountKey"}' \
'http://localhost:8080/v1/apikeys' \
--retry 5

#HTTP_STATUS="$(curl -IL --silent example.com | grep HTTP )";
#echo "${HTTP_STATUS}";
