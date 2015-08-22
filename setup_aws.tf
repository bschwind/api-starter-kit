provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.s3_bucket}"
    acl = "private"
}

resource "aws_instance" "api-starter-kit-dev" {
    ami = "ami-936d9d93"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = "ansible --version"
    }
}
