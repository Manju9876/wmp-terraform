resource "null_resource" "ansible_code" {
  # depends_on = [aws_route53_record.records]

  triggers = {
    #instance_id_change = aws_instance.instances.id
    always_run = timestamp()
  }
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "ec2-user"
      #      private_key = file(var.private_key_pem)
      password = "DevOps321"
      host     = var.public_ip
    }

    inline = [
      "sudo python3.11 -m pip install ansible hvac",
      "ansible-pull -i localhost, -U https://github.com/Manju9876/wmp-ansible roboshop.yaml -e component_name=${var.component_name} -e env=${var.env}"
    ]
  }
}