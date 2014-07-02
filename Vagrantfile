VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "hashicorp/precise32"
  config.vm.box = "ubuntu/trusty32"

  config.vm.network :forwarded_port, guest: 80, host: 8889
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
