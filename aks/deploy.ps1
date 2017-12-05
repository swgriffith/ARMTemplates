Login-AzureRmAccount

$rgName = "<RGName>"
$location = "<Location>"
$ArmTemplatePath = ".\azuredeploy.json"
$additionalParams = ".\azuredeploy.parameters.json"

New-AzureRmResourceGroup -Name $rgName -Location $location
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile $ArmTemplatePath -TemplateParameterFile $additionalParams -DeploymentDebugLogLevel All
