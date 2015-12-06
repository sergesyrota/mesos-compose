Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  
  config.vm.define "master" do |master|
    master.vm.provision "shell", path: "master/provision.sh"
	master.vm.network "private_network", ip: "192.168.33.10"
  end
  
  config.vm.define "master" do |master|
    master.vm.provision "shell", path: "mesos-slave/provision.sh"
	master.vm.network "private_network", ip: "192.168.33.11"
  end
  
end
