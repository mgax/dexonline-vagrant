# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "lucid32"

  config.vm.network :hostonly, "192.168.13.11"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "vagrant_main"
    chef.json = {
        :mysql => {
            :server_root_password => ""
        }
    }
  end

  config.vm.share_folder "dexonline-repo", "/dexonline", "../"

end
