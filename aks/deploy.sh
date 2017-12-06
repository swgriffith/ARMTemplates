#!/bin/bash
# Arguments
# -r Resource group name
# -l Location Name
while getopts r:l:f: option
do
	case "${option}"
	in
		r) RESOURCEGROUP=${OPTARG};;
		l) LOCATION=${OPTARG};;
                f) PARAMFILE=${OPTARG};;
	esac
done

# Functions
trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

echo "Input parameters"
echo "   location ${LOCATION}"
echo "   resource group ${RESOURCEGROUP}" 
echo "   parameter file ${PARAMFILE}"; echo

#--------------------------------------------
# Creating Resource Group
#-------------------------------------------- 
echo "Creating resource group  ${RESOURCEGROUP}"
RESULT=$(az group exists -n $RESOURCEGROUP)
if [ "$RESULT" != "true" ]
then
	az group create -l $LOCATION -n $RESOURCEGROUP
else
	echo "   Resource group ${RESOURCEGROUP} already exists"
fi


az group deployment create \
    --name $RESOURCEGROUP \
    --resource-group $RESOURCEGROUP \
    --template-file azuredeploy.json \
    --parameters @$PARAMFILE
