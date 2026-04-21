resource "aws_instance" "web" {
  ami           = data.aws_ami.ami
  instance_type = "t3.micro"

  tags = {
    Name = var.tag_name
  }
}
