require_recipe "apache2::mod_php5"
require_recipe "mysql::server"

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

packages = %w{build-essential smarty php5-mysql php5-cli}
  packages.each do |pkg|
  apt_package pkg do
    action :install
  end
end

execute "setup-dexonline" do
  cwd "/dexonline"
  command "tools/setup"
  command "mysql -u root -e 'create database if not exists DEX character set utf8;'"
end
