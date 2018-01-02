#----------------------#
#- General / Resource -#
#----------------------#
count                        = "1"
project_id                   = "02631cef-3b10-4630-aac6-73e6083436a1"
hostname                     = "alexxnica-dev"
plan                         = "baremetal_0"
billing_cycle                = "hourly"
facility                     = "ewr1"
operating_system             = "ubuntu_17_10"
lsb_release                  = "artful"
spot_price_max               = "0.01"

#-------------------------#
#- General / Provisioner -#
#-------------------------#
to_create_username           = "alexxnica"
to_create_temporary_password = "Alexx123@"
to_create_name               = "Alexandre Nicastro"

#-------------------#
#- Package Related -#
#-------------------#
# Comma separated list of packages to be installed, from left-to-right (e.g. git,gradle,netcat-openbsd,zip)
to_install_apt_packages      = "git,python-pip,python3-pip,gradle,apt-transport-https,ca-certificates,curl,software-properties-common,netcat-openbsd,zip,linux-headers-generic,linux-headers-4.13.0-16-generic"
to_install_pip_packages      = "setuptools,ansible,jinja2,docker-py"
to_install_pip3_packages     = "setuptools,ansible,jinja2,docker-py"
