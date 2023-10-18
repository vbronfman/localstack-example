# localstack-example
Terraform manifest to spawn localstack docker and run sample workload
Inspired and guided by [ based upon ](https://github.com/devopsjourney1/localstack-101)https://github.com/devopsjourney1/localstack-101 
 [Localstack](https://docs.localstack.cloud/getting-started/ )   "...is a cloud service emulator that runs in a single container on your laptop or in your CI environment. With LocalStack, you can run your AWS applications or Lambdas entirely on your local machine without connecting to a remote cloud provider!"
The project spawns _localstack/localstack_ container and then provisions ephemeral EC2 instances via local AWS endpoints. 
