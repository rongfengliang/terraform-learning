#!/bin/bash
echo "CONSUL_ADDRESS = ${consul_address}" > /tmp/iplist
mkdir -p  /opt/data/pg

{
  "name":"${name}",
  "age": "${age}",
  "platform":"${platform}",
  "id":"${uuid()}"
}