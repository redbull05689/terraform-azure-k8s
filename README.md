### login to Azure
az login



### Login to az cli as a subscrition owner
az login
### Add principal
az ad sp create-for-rbac --role=“Owner” --scopes="/subscriptions/c23293cc-6bd1-4b0a-bb98-4a4153b85776/resourceGroups/quantori"

### Add credentials from new service principals to variables.tf
azurerm_subscription_id
azurerm_client_id
azurerm_client_secret
azurerm_tenant_id


### Added cpecial permissions to principal for createting via web portal
```
portal.azure.com -> App registrations -> Api permossions -> Add permissions -> Azure active Directory Graph -> Application permission 
-> Application ->  Application.readWrite.All -> Add permissions
```
Press button
```
Grant admin consent for Default Directory
```

### Init terraform provider
terraform init

### Plan
terraform plan

### Run
terraform apply

### Get credentials
az aks get-credentials --name k8sclusrer --resource-group quantori

### Login to ACR from laptop
az acr login --name quantorireg

### Push test image from registry
docker push quantorireg.azurecr.io/frontend:0.1