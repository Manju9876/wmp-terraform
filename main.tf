module "network" {
  source = "./modules/network"
  for_each = var.component_name

  component_name = each.key
  env = "dev"
}

module "compute" {
  source = "./modules/compute"
  for_each = var.component_name

  sg_id = module.network[each.key].sg_id

}

module "dns" {
  source = "./modules/dns"
  for_each = var.component_name


 private_ip = module.compute[each.key].private_ip
}