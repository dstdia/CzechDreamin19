#!/usr/bin/env bash

# Create scratch org
sfdx force:org:create -f config/project-scratch-def.json -a Czech19Trial -s
if [[ $? -gt 0 ]] ; then exit 1; fi

# Install MyTriggers
sfdx force:package:install -p 04t1i000000gZ4HAAU -w 10
if [[ $? -gt 0 ]] ; then exit 1; fi

# Push metadata
sfdx force:source:push
if [[ $? -gt 0 ]] ; then exit 1; fi
	
# Assign Permissions
sfdx force:permset:assign -n logger
if [[ $? -gt 0 ]] ; then exit 1; fi
	

# Load Data
sfdx force:data:bulk:upsert -f data/Accounts.csv -s Account -i ExtId__c  -w 10
if [[ $? -gt 0 ]] ; then exit 1; fi
	
sfdx force:data:bulk:upsert -f data/Contacts.csv -s Contact -i ExtId__c  -w 10
if [[ $? -gt 0 ]] ; then exit 1; fi
	
sfdx force:data:bulk:upsert -f data/Products.csv -s Product2 -i ExtId__c  -w 10
if [[ $? -gt 0 ]] ; then exit 1; fi
