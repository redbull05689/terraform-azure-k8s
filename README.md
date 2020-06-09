### login to Azure
az login

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
