__THIS CONFIGURATION IS NOT FUNCTIONAL!__ 

Linode does not support RWX file system PVCs in their CSI solution. Maybe this will be added in the future. 

#  Setup

## Linode account 
Create an Linode account and generate an API token. Add this token to the terraform configuration. 

## Create Cluster 

Instantiate the LKE cluster by running 

```
terraform init
terrafrom apply 
```

## Configure Cluster 

1. Install ingress controller: 
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install \
  ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --version 4.0.17 \
  --create-namespace \
  --values ingress-nginx-helm-values.yml
```
2. Install cert-manager 
```
helm repo add jetstack https://charts.jetstack.io
helm update
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1

```
3. Add your email address to the Lets encrypt configuration
```
kubectl apply -f cert-manager-LE-prod.yml
```

## Install Artemis 

```
helm repo add artemis https://ls1intum.github.io/artemis-helm/
helm repo update
helm upgrade --install artemis-test artemis \
  --create-namespace \
  --namespace artemis -f artemis-helm-values.yml
```
