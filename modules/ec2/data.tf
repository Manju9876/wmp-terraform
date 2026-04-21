data "aws_ami" "ami" {
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

data "aws_security_group" "selected" {

  filter {
    name   = "name"
    values = ["allow-all"]
  }

}
output "ami" {
  value = data.aws_ami.ami
}
output "security" {
  value = data.aws_security_group.selected
}