# "Salesforce App"

This guide helps Salesforce developers who are new to Visual Studio Code go from zero to a deployed app using Salesforce Extensions for VS Code and Salesforce CLI.

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

### Open Source Software

Our demo code makes use of Open Source software, published under the licenses stated below. Please review the license when using / adapting any code contained in this repository:

* Logger published by Christian Szandor Knapp. See https://github.com/Szandor72/logger
* MyTriggers published under MIT License by appero GmbH. See https://github.com/appero-com/MyTriggers


### Org Development Model

The org development model allows you to connect directly to a non-source-tracked org (sandbox, Developer Edition (DE) org, Trailhead Playground, or even a production org) to retrieve and deploy code directly. This model is similar to the type of development you have done in the past using tools such as Force.com IDE or MavensMate.

To start developing with this model in Visual Studio Code, see [Org Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/org-development-model). For details about the model, see the [Org Development Model](https://trailhead.salesforce.com/content/learn/modules/org-development-model) Trailhead module.

If you are developing against non-source-tracked orgs, use the command `SFDX: Create Project with Manifest` (VS Code) or `sfdx force:project:create --manifest` (Salesforce CLI) to create your project. If you used another command, you might want to start over with this command to create a Salesforce DX project.

When working with non-source-tracked orgs, use the commands `SFDX: Deploy Source to Org` (VS Code) or `sfdx force:source:deploy` (Salesforce CLI) and `SFDX: Retrieve Source from Org` (VS Code) or `sfdx force:source:retrieve` (Salesforce CLI). The `Push` and `Pull` commands work only on orgs with source tracking (scratch orgs).

## The `sfdx-project.json` File

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

The most important parts of this file for getting started are the `sfdcLoginUrl` and `packageDirectories` properties.

The `sfdcLoginUrl` specifies the default login URL to use when authorizing an org.

The `packageDirectories` filepath tells VS Code and Salesforce CLI where the metadata files for your project are stored. You need at least one package directory set in your file. The default setting is shown below. If you set the value of the `packageDirectories` property called `path` to `force-app`, by default your metadata goes in the `force-app` directory. If you want to change that directory to something like `src`, simply change the `path` value and make sure the directory you’re pointing to exists.

```json
"packageDirectories" : [
    {
      "path": "force-app",
      "default": true
    }
]
```

## Part 2: Working with Source

For details about developing against scratch orgs, see the [Package Development Model](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_dev_model) module on Trailhead or [Package Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/package-development-model).

For details about developing against orgs that don’t have source tracking, see the [Org Development Model](https://trailhead.salesforce.com/content/learn/modules/org-development-model) module on Trailhead or [Org Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/org-development-model).

## Part 3: Deploying to Production

Don’t deploy your code to production directly from Visual Studio Code. The deploy and retrieve commands do not support transactional operations, which means that a deployment can fail in a partial state. Also, the deploy and retrieve commands don’t run the tests needed for production deployments. The push and pull commands are disabled for orgs that don’t have source tracking, including production orgs.

Deploy your changes to production using [packaging](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_dev2gp.htm) or by [converting your source](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_source.htm#cli_reference_convert) into metadata format and using the [metadata deploy command](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_mdapi.htm#cli_reference_deploy).