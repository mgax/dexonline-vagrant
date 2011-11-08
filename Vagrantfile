Vagrant::Config.run do |config|

  config.vm.box = "lucid32"

  config.vm.network "33.33.33.10"
  config.vm.boot_mode = :gui

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"
  end

  config.vm.share_folder "dexonline-repo", "/dexonline", "../dexonline"

end
