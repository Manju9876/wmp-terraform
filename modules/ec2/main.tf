resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.sg-id]

  tags = {
    Name = "${var.component_name}-${var.dev}"
  }
}

