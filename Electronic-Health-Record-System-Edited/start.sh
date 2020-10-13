#!/bin/bash
# Commands required to instatiate the network and start the REST-API 
# Please makesure that the pre-requisites are met and the fabric is running before this script 
# Fabric can be started using cd ~/fabric-dev-servers/ && ./startFabric.sh 
composer archive create -t dir -n .
composer network install --card PeerAdmin@hlfv1 --archiveFile ehr@0.0.1.bna
# Use the following line if the CCENV is not pulled from docker 
# docker pull hyperledger/fabric-ccenv:1.2.1
docker tag hyperledger/fabric-ccenv:1.2.1 hyperledger/fabric-ccenv:latest
composer network start --networkName ehr --networkVersion 0.0.1 --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --file networkadmin.card
composer-rest-server -c admin@ehr -n always -u true -d y -w true
