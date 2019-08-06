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
sfdx force:user:permset:assign -n LoggerPermissions
if [[ $? -gt 0 ]] ; then exit 1; fi

sfdx force:user:permset:assign -n CodeClicksKafka
if [[ $? -gt 0 ]] ; then exit 1; fi