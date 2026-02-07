provider "google" {
  project   = "graceful-medley-308610"
  region    = "asia-northeast1"
  zone      = "asia-northeast1-a"
}

module "Network-Setup" {
    source = "./modules/Network-Setup"
}

module "VM-Setup" {
    source = "./modules/VM-Setup"
    
    vpc_name    = module.Network-Setup.vpc_name
    subnet_name = module.Network-Setup.subnet_name

    depends_on = [ module.Network-Setup ]
}
