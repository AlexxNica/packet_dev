variable "packet_api_key" {
  description = "Your Packet API key"
}

variable "project_id" {
  description = "ID of the Project to create the resources in"
}

variable "count" {
  description = ""
}

variable "operating_system" {
  description = ""
}

variable "billing_cycle" {
  description = ""
}

variable "hostname" {
  description = ""
}

variable "facility" {
  description = "Packet facility: US East [ewr1], US West [sjc1], or EU [ams1]. Default: ewr1"
  default     = "ewr1"
}

variable "plan" {
  description = "Instance Type of Agent"
  default     = "baremetal_0"
}

variable "spot_price_max" {
  description = "Maximum price for the spot market bid"
  default     = 0.00
}

variable "to_create_username" {
  description = "Username to be created"
}

variable "to_create_temporary_password" {
  description = "Temporary password used until first login"
}

variable "to_create_name" {
  description = "Name of the username"
}

variable "lsb_release" {
  description = "Release name of the current distribution (e.g. artful, zesty)"
}

variable "to_install_apt_packages" {
  description = "Comma separated list of packages to be installed using apt, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
}

variable "to_install_pip_packages" {
  description = "Comma separated list of packages to be installed using pip, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
}

variable "to_install_pip3_packages" {
  description = "Comma separated list of packages to be installed using pip3, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
}
