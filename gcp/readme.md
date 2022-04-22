__Prerequisites__:

- Google Account and gcloud access
- gcloud credits (You get 300$ for 90 Days at first signup)
- A domain name (You will need to set an A record in the process)

#  Setup

## Google Account
1. Connect gcloud to your google account 
```
gcloud init 
gcloud auth application-default login
```
2. Obtain gcloud project: 
```
gcloud config get-value project
```
3. Add this project id to the `terraform.tfvars` file 


## Create Cluster 

1. Instantiate the GKE cluster by running 

```
terraform init
terrafrom apply 
```

2. Add the new cluster to your kubeconfig file. ([ref](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl))

## Configure Cluster

1. Create IP address for you ingress ([ref](https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs#gcloud)):
```
gcloud compute addresses create artemis-ingress-ip --global
gcloud compute addresses describe artemis-ingress-ip --global
```
2. Add an A record to your domain for the returned IP address
3. Adapt the `artemis-helm-values.yml` file to point to your domain name 

## Install Artemis 
1. Install helm chart
```
helm repo add artemis https://ls1intum.github.io/artemis-helm/
helm repo update
helm upgrade --install artemis artemis/artemis \
  --create-namespace \
  --namespace artemis \
  -f artemis-helm-values.yml
```

2. Adapt the `gc-certificate.yml` (See FIXME) and add your domain.
3. Create the certificate (This will take a while and will only work, if you configured your domain correctly)
```
kubectl apply -f gc-certificate.yml
```
