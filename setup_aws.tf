provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_key_pair" "deployer" {
  key_name = "${public_deploy_key_name}"
  public_key = "${var.public_deploy_key}"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.s3_bucket}"
    acl = "private"
}

resource "aws_instance" "api-starter-kit-dev" {
    ami = "ami-936d9d93"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.deployer.key_name}"

    provisioner "local-exec" {
        command = "ansible --version"
    }
}

output "dns" {
    value = "${aws_instance.api-starter-kit-dev.public_dns}"
}
