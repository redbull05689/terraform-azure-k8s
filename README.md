
### Login to az cli as a subscrition owner
az login
### Add principal
az ad sp create-for-rbac --role=“Owner” --scopes="/subscriptions/63b36228-9450-4bb7-8212-941bd58f513c/resourceGroups/quantori"

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
az aks get-credentials --name k8scluster --resource-group quantori

### Login to ACR from laptop
az acr login --name quantorireg

### Push test image from registry
docker push quantorireg.azurecr.io/frontend:0.1

az login --service-principal --username XXXXXXX --password XXXXXXX --tenant XXXXXX

kubectl create namespace ingress-basic

helm upgrade --install nginx stable/nginx-ingress \
    --namespace ingress-basic \
    --set controller.replicaCount=1 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.service.loadBalancerIP="52.158.214.186"


    kubectl create secret generic basic-auth --from-file=auth



kubectl apply -f example_cluster-issuer-prod.yaml 
 
kubectl apply -f example_certificates.yaml --validate=false

kubectl apply -f example_ingress.yaml



    helm upgrade --install postgres \
             --set image.repository=postgres \
             --set image.tag=13 \
             --set postgresqlDataDir=/data/pgdata \
             --set persistence.mountPath=/data \
             --set postgresqlPassword=Password \
             bitnami/postgresql -n bioeditor-stg

             helm uninstall postgres -n testpg

    helm upgrade --install redis \
            --set password=5bnGEjrRCphFhJlzGdfs31jVzuqmGXgg \
            --set cluster.enabled=false \
            --set master.persistence.size=2Gi \
            bitnami/redis -n bioeditor-qa


    helm uninstall redis -n redistest
