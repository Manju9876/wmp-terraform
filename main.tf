module "network" {
  source = "./modules/network"
  for_each = var.component_name

  component_name = each.key
  env = "dev"
}

module "compute" {
  source = "./modules/compute"
  for_each = var.component_name

  component_name = each.key
  sg_id = module.network[each.key].sg_id
  env = ""
}

module "dns" {
  source = "./modules/dns"
  for_each = var.component_name

  component_name = each.key
  private_ip = module.compute[each.key].private_ip
  env            = ""
}

module "ansible" {
  source = "./modules/ansible"
  for_each = var.component_name

  component_name= each.key
  public_ip = module.compute[each.key].public_ip
  env = ""
}