

# Create scratch org
sfdx force:org:create -f ./config/project-scratch-def.json -a Czech19Trial -s

# Install MyTriggers
sfdx force:package:install -p 04t1i000000gZ4HAAU -w 10

# Push metadata
sfdx force:source:push
	
# Assign Permissions
sfdx force:user:permset:assign -n LoggerPermissions
sfdx force:user:permset:assign -n CodeClicksKafka

# Load Data