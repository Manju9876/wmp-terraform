module "network" {
  source = "./modules/network"
  for_each = var.component_name

  component_name = each.key
  env = "dev"
}

module "ec2" {
  source = "./modules/ec2"
  for_each = var.component_name

  sg_id = module.network[each.key].sg_id

}