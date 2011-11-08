require_recipe "apache2::mod_php5"

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

apache_module "php5" do
  enable true
end

web_app "dexonline" do
  template "dexonline.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end

packages = %w{build-essential libphp-adodb smarty}
  packages.each do |pkg|
  apt_package pkg do
    action :install
  end
end
