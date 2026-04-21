module "network" {
  source = "./modules/network"
  for_each = var.component_name

  component_name = each.key
  env = "dev"
}