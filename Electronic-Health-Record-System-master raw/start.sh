#!/bin/bash

#Start the required docker containers, create channel and instantiate chaincode
#Create required cryptographic material and channel configuration (generate.sh) before running this script
composer archive create -t dir -n .
composer network install --card PeerAdmin@hlfv1 --archiveFile ehr@0.0.3.bna
composer network start --networkName ehr --networkVersion 0.0.3 --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --file networkadmin.card
composer card import --file networkadmin.card
composer-rest-server -c admin@ehr -n always -u true -d y -w true