variable [{
  "packet_api_key" {
    description = "Your Packet API key"
  }
  "project_id" {
    description = "ID of the Project to create the resources in"
  }
  "count" {
    description = ""
  }
  "operating_system" {
    description = ""
  }
  "billing_cycle" {
    description = ""
  }
  "hostname" {
    description = ""
  }
  "facility" {
    description = "Packet facility: US East [ewr1], US West [sjc1], or EU [ams1]. Default: ewr1"
    default     = "ewr1"
  }
  "plan" {
    description = "Instance Type of Agent"
    default     = "baremetal_0"
  }
  "spot_price_max" {
    description = "Maximum price for the spot market bid"
    default     = 0.00
  }
  "to_create_username" {
    description = "Username to be created"
  }
  "to_create_temporary_password" {
    description = "Temporary password used until first login"
  }
  "to_create_name" {
    description = "Name of the username"
  }
  "lsb_release" {
    description = "Release name of the current distribution (e.g. artful, zesty)"
  }
  "to_install_apt_packages" {
    description = "Comma separated list of packages to be installed using apt, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
  }
  "to_install_pip_packages" {
    description = "Comma separated list of packages to be installed using pip, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
  }
  "to_install_pip3_packages" {
    description = "Comma separated list of packages to be installed using pip3, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)"
  }
}]
