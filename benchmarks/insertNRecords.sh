#!/bin/bash	
if [ $# -eq 0 ]
  then
    echo "Error: Please specify the number of records to insert."
	echo "Usage:"
	echo "./insertNRecords.sh <number of records>"
fi

if [ $# -gt 0 ]
	then
		echo "List<Mock__c> lMocks = new List<Mock__c>();
			for (Integer i = 0; i < $1; i++) {
				lMocks.add(new Mock__c(
					Name = 'Mock ' + String.valueOf(i)
				));
			}
			insert lMocks;" | sfdx force:apex:execute
fi