#Use the following commands from the Azure CLI to deploy
az group create --name <your resource group name> --location <your location>

az group deployment create --name <whatever you want to call the deployment> --resource-group <your resource group name> --template-file azuredeploy.json --parameters @azuredeploy.parameters.json
