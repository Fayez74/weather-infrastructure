# Weather API
The repo holds the following configuration for the WeatherAPI app
- Terraform files
- Kubernetes yaml files

## Terraform
The terraform held in this directory creates the following resources:
- VPC
- Remote state (S3 and DynamoDB table)
- EKS cluster/node group
- modules

## Kubernetes
The kubernetes config held in this directory creates the following resources:
- deployment
- autoscaler
- load balancer

# Deployment Steps - Terraform

## Pre Requisites
- Configure AWS Cli with the correct credentials
- Install kubectl and connect to AWS

## Deployment
In order to deploy everything in the repo, the weather api image must be built first. This can be found in https://github.com/Fayez74/weather-api 
Follow steps in that repo, in order to proceed

- After creating the image, run the terraform in the following order

```
cd /terraform/vpc
terraform init
terraform plan
terraform apply

cd /terraform/remote-state
terraform init
terraform plan
terraform apply
Run terraform init to move state to S3 (type yes when prompted)

Return to /terraform/vpc and run terraform init to move state to s3

cd /terraform/eks
terraform init
terraform plan
terraform apply

```

# Deployment Steps - Kubernetes

In order to deploy the kubernetes config, ensure that the EKS cluster and node groups have already been deployed via Terraform. Once complete run these steps
```
cd /k8s
kubectl create -f deploy.yaml
kubectl create -f loadbalancer.yaml
```

## Testing

Local Testing
- Ran node install & node start locally to see apps functionilty
- Added dotenv as a dependancies to allow Environmenta variables to be used
- Ran Docker container locally also

Once deployment is complete, run kubectl get svc to display the loadbalancer address. Copy this into the browser along with the port number to display the app






