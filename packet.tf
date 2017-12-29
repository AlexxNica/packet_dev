# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_api_key}"
}

# Create a device and add it to the project
resource "packet_device" "dev" {
  billing_cycle    = "${var.billing_cycle}"
  count            = "${var.count}"
  facility         = "${var.facility}"
  hostname         = "${var.hostname}"
  operating_system = "${var.operating_system}"
  plan             = "${var.plan}"
  project_id       = "${var.project_id}"
  spot_instance    = "${var.spot_price_max > 0.00 ? true : false}"
  spot_price_max   = "${var.spot_price_max}"

  # Main Setup
  provisioner "remote-exec" {
    inline = [
      "adduser --disabled-password --gecos '${var.to_create_name}' ${var.to_create_username}",
      "echo '${var.to_create_username}:${var.to_create_temporary_password}' | chpasswd",
      "usermod -aG sudo ${var.to_create_username}",
      "apt-get update",
      # "apt-get upgrade -y",
      "apt-get remove -y apparmor",
      "apt-get install -y apparmor",
      "for var in ${var.to_install_apt_packages}; do apt-get install -y $var; done",
    ]
  }

  # Setup Continuation
  # provisioner "remote-exec" {
  #   inline = [
  #     "apt-get install -y git",
  #     "apt-get install -y python-pip",
  #     "apt-get install -y python3-pip",
  #     "apt-get install -y gradle",
  #     "apt-get install -y apt-transport-https",
  #     "apt-get install -y ca-certificates",
  #     "apt-get install -y curl",
  #     "apt-get install -y software-properties-common",
  #     "apt-get install -y netcat-openbsd",
  #     "apt-get install -y zip",
  #     "wget https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.deb | apt-get install -f",
  #     "apt-get install -y linux-headers-generic",
  #     "apt-get install -y linux-headers-4.13.0-16-generic",
  #     "sudo curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -",
  #     "add-apt-repository 'deb http://download.virtualbox.org/virtualbox/debian ${var.lsb_release} contrib'",
  #     "apt-get install -y virtualbox-5.2",
  #     "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -",
  #     "apt-key fingerprint 0EBFCD88",
  #     "add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu ${var.lsb_release} test'",
  #     "apt-get update",
  #     "apt-get install -y docker-ce",
  #     "docker run hello-world",
  #     "groupadd docker",
  #     "usermod -aG docker ${var.to_create_username}",
  #     "systemctl enable docker",
  #     "pip install --upgrade setuptools",
  #     "pip3 install --upgrade setuptools",
  #     "pip install ansible",
  #     "pip install jinja2",
  #     "pip install docker-py",
  #     "pip3 install ansible",
  #     "pip3 install jinja2",
  #     "pip3 install docker-py",
  #     "echo 'export HOST=localhost' >> /home/${var.to_create_username}/.bashrc",
  #     "mkdir -p /etc/docker/certs",
  #     "mkdir -p /home/${var.to_create_username}/certs",
  #     "mkdir -p /etc/systemd/system/docker.service.d",
  #     "systemctl daemon-reload",
  #     "service docker restart",
  #     "mkdir -p /home/${var.to_create_username}/.docker",
  #     "touch /home/${var.to_create_username}/.cloud-warnings.skip",
  #     "echo '${var.to_create_username} ALL=NOPASSWD: /usr/bin/apt-get' | EDITOR='tee -a' visudo",
  #     "chage -d 0 ${var.to_create_username}",
  #     # "cp -v $HOME/certs/{cert,key}.pem $HOME/.docker",
  #     # "cp -v /etc/docker/certs/ca.pem $HOME/.docker",
  #     # "chmod -R 744 $HOME/.docker",
  #     # "docker --tlsverify --tlscacert=/home/${var.to_create_username}/.docker/ca.pem --tlscert=/home/${var.to_create_username}/.docker/cert.pem --tlskey=/home/${var.to_create_username}/.docker/key.pem version",
  #     # "export DOCKER_HOST=tcp://127.0.0.1:2376 DOCKER_TLS_VERIFY=1",
  #     # "docker ps",
  #   ]

  #   connection {
  #     type = "ssh"
  #     user = "root"
  #     # password = "${packet_device.dev.root_password}"
  #   }
  # }

  # Transfer docker `daemon.json` file
  provisioner "file" {
    source      = "./files/daemon.json"
    destination = "/etc/docker/daemon.json"
  }

  # Transfer systemd drop-in units
  provisioner "file" {
    source      = "./files/docker.conf"
    destination = "/etc/systemd/system/docker.service.d/docker.conf"
  }

  # Reboot for the last time before handing the machine to the user
  provisioner "remote-exec" {
    inline = [
      "echo 'Finished! Rebooting for the last time...'",
      "reboot"
    ]
  }

  # Notification to signal that the machine is ready to be used
  provisioner "remote-exec" {
    inline = [
      "echo 'Machine ready!'",
    ]
  }
}
