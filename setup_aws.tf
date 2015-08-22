provider "aws" {
    access_key = "AKIAIPX7GQDUA5F4A2CQ"
    secret_key = "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"
    region = "ap-northeast-1"
}

resource "aws_instance" "api-starter-kit-dev" {
    ami = "ami-936d9d93"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = "ansible --version"
    }
}
