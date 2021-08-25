# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.box = "launchquickly/focal64"
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
  config.vm.define "docker" do |docker|
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.100.100"
    docker.vm.provider "virtualbox" do |vb|
      vb.name = "docker"
      vb.cpus = "2"
      vb. memory = "4096"
    end
    docker.vm.provision "shell", path: "scripts/docker-provision.sh"
  end
end
