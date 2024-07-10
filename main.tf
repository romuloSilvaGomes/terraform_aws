provider "aws" {
  region = "us-east-1" # substitua pela sua região preferida
}

resource "aws_instance" "instanciaAws" {
  ami           = "ami-06c68f701d8090592" # substitua pelo AMI de sua preferência
  instance_type = "t2.micro"

  tags = {
    Name = "Instancia Italent"
  }
}

# Provedor AWS adicional para us-east-2
provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

resource "aws_s3_bucket" "bucketS302" {
  provider = aws.us-east-2
  bucket = "terraform-aws2024" # substitua pelo nome do bucket
  acl    = "private"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}

