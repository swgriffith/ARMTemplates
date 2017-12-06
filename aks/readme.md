# Azure Kubernetes Service ARM Template
The azuredeploy.json in this repo demonstrates how you can deploy an AKS cluster via Azure Resource Manager. Additionally you'll find the following files:

* azuredeploy.parameters.json - Standard parameters file
* azuredeploy_keyvault.parameters.json - Modified parameters file to pull service principal id and password from Azure Key Vault

Before running deploy.sh make sure you've added your secrets for the service principal name and passwd to your Azure Key Vault, and that you've modified the 'Advanced access policies' in the Azure portal for the key vault to turn on 'Enable access to Azure Resource Manager for template deployment'. This will grant ARM the ability to read your key vault for the purposes of ARM template deployment, to simplify deployment setup. Alternatively you could create a service principle specific for ARM deployment and only grant secret access for that specific SP, but it will be a bit harder to manage.

deploy.sh takes the following three parameters:

-r Resource Group Name

-l Location of the Resource Group, which will also be used as the location of the AKS cluster

-f path to the ARM template parameters file

