provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  region  = "eu-west-1"
  alias   = "ireland"
}

provider "aws" {
  region  = "eu-west-2"
  alias   = "london"
}

resource "aws_prometheus_workspace" "amp" {
  provider = aws.london
  alias = var.amp_alias
}
