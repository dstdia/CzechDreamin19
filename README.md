# "The Trial. Clicks, Code, and Kafka"

Demo Code from the presentation held at CzechDreamin' '19 by [!Christian Szandor Knapp](https//github.com/szandor72) and [!Daniel Stange](https//github.com/dstdia) on August 16, 2019.

Session Abstract: "Code works just fine. Clicks work just fine. But when you combine code and clicks – Apex Trigger and Process Builder Actions for example, this is where you invite Kafka’s paradoxes – also known as WTFs? – into your Org: Everything looks peachy at the beginning, over time you add more functionality only to wake up one morning to find your org transformed into a gigantic bug.

In this session we will demonstrate how easy it is to really blow things up using code and clicks. And, of course, how to avoid this scenario altogether. We will put our – and your – assumptions on Trial: Is it true that Apex performs faster than Flow? Can CPU Time exceptions be avoided? Do best practices we know from Code apply to Clicks as well?"

[! Presentation Slides from Czech Dreamin' 19 on Google Drive] (https://drive.google.com/file/d/1WW71_U3nE1LPd3lETS-s5_Smucoxv3xs/view?usp=sharing) 

## Assisted Deployments to a Scratch Org or a Developer Org 

Use either of these two options to deploy straight into a Scratch Org or a Developer Org / Sandbox using the "Deploy To Salesforce DX" or "Deploy To Salesforce" buttons.

[![Deploy with SFDX](https://deploy-to-sfdx.com/dist/assets/images/DeployToSFDX.svg)](https://deploy-to-sfdx.com)

[![Deploy to Salesforce](https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png)](https://githubsfdeploy.herokuapp.com/app/githubdeploy/dstdia/CzechDreamin19_Kafka
)

We strongly recommend not to deploy to Production Orgs. Our samples are build to benchmark 

## Build From Source with Salesforce DX 

We have simplified the installation with Salesforce DX by providing a shell script. 
For Windows, run createScratchOrg.ps1 in Powershell
For Mac/Unix/Linux, run createScratchOrg.sh in the terminal of choice.

The shell script performs the following steps:

* Create a scratch org from the included config file
* Installs MyTriggers as an Unlocked Package
* Pushes a release version of Logger to the scratch org
* Pushes the demo code & metadata to the scratch org
* Assigns the permission set LoggerPermissions to the running user
* Assigns the permission set CodeClicksKafka to the running user

If you want to manually build from scratch, please consider completing these steps before you try to run the examples. 

# Run the benchmarks

## Switching the logic

The sample code contains three Custom Metadata Type to configure the logic
* Logger
* MyTrigger Config
* Process Builder Config

### Activate / Deactivate the Logger

### Activate / Deactivate Triggers

### Control the Executed Units in Process Builder
Using this Custom Metadata Type record, you can select which unit will actually do the work that ProcessBuilder "Mock" is about to perform. 

* "Node" - executes a node in the same Process Builder
* "Subprocess" - executes an invocable Process Builder ("createMockMocks")
* "Flow" - executes an autolaunched Flow ("createMockMocksFlow")
* "Apex" - executes an Invocable Method ("Invocable_MockMockService.createMockMock()")
* "Flow + 2x Apex" - executes an autolaunched Flow ("createDeepMockMocks") that sequentially invokes two Invocable Methods  (Invocable_MockMockService.createMockMock(), Invocable_MockMockCheckService.checkMockMock() 

### Bulk Uploads

Utilize the Mock__c import file to load

## Open Source Software

Our demo code makes use of Open Source software, published under the licenses stated below. Please review the license when using / adapting any code contained in this repository:

* Logger published by Christian Szandor Knapp. See https://github.com/Szandor72/logger
* MyTriggers published under MIT License by appero GmbH. See https://github.com/appero-com/MyTriggers


