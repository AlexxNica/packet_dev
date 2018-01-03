# Variables
variable "packet_api_key" {
  description = "Your Packet API key"
}

# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_api_key}"
}

module "dev" {
  source = "./dev"
}
