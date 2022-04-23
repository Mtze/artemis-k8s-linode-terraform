# artemis-k8s-terraform
An example K8s cluster terraform configuration for Artemis on different cloud platforms

# Cloud Providers

## Google Cloud 
Artemis can be hosted in google cloud. An example setup is outlined in the `gcp` folder.

## Linode 
Unfortunately, Linode currently does not support RWX Filesystem PVCs directly. Hence, Artemis cannot be deployed to Linode without installing a custom storage solution. 

