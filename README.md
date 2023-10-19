# localstack-example
Terraform manifest to spawn localstack docker and run sample workload.

[Localstack](https://docs.localstack.cloud/getting-started/ )   "...is a cloud service emulator that runs in a single container on your laptop or in your CI environment. With LocalStack, you can run your AWS applications or Lambdas entirely on your local machine without connecting to a remote cloud provider!"

The project spawns _localstack/localstack_ container and then provisions ephemeral EC2 instances via local AWS endpoints. 

Inspired and guided by [ devopsjourney1 ](https://github.com/devopsjourney1/localstack-101) 

## Pre-requisute
The project make use of Docker daemon spawns Localstack container - either local or remote.

Default ports of localstach container to expose are 4566, 4571.

The project is a regular Terraform solution and requires access to Terraform repository.

## Usage:
The project is a regular terraform set 
```javascript
terraform init
_terraform plan_
_terraform apply_
```

In case of success there is Docker container runs Localstack. This one serves simulation of AWS API endpoints.   [See official docs]: [https://docs.localstack.cloud/user-guide/integrations/]

Note
There is setting of _ignore_changes = all_ to prevent restart of container. The purpose is to avoid mischief due to ephemeral nature of AWS resources on top of Localstack
