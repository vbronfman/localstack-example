terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.27"
    }
    docker = {
      source = "kreuzwerker/docker"
      # version = "~> 3.0.1"
  }

}
required_version = "~> 1.6.0"

}


provider "docker" {
    #  host = "tcp://127.0.0.1:55555"
    host = "unix:///var/run/docker.sock"
}

/* resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
} */

// docker run --rm -it -p 4566:4566 -p 4571:4571 localstack/localstack
resource "docker_container" "localstack" {
  image = "localstack/localstack"
  name  = "localstack"
  ports {
    internal = 4566
    external = 4566
  }
   ports {
    internal = 4571
    external = 4571

  }
    restart = "unless-stopped"
    tty = true
    stdin_open = true
    must_run = true

     lifecycle {
     ignore_changes = all
    }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  # s3_force_path_style         = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
 
  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    # ec2            = "http://127.0.0.1:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

resource "aws_instance" "myserver" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  count = 6
  depends_on = [ time_sleep.wait_n_seconds ]

  tags = {
    Name = "Server${count.index + 1}",
  }
 }

resource "time_sleep" "wait_n_seconds" {
  create_duration = "10s"
  depends_on = [docker_container.localstack]
}
