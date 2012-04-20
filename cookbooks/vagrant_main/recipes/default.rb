require_recipe "apt"
require_recipe "apache2::mod_php5"
require_recipe "mysql::server"
include_recipe "php::module_mysql"

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

web_app "dexonline" do
  template "dexonline.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end

packages = %w{build-essential smarty php5-mysql php5-cli
              python-virtualenv python-dev libxml2-dev libxslt1-dev}
  packages.each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

execute "setup-dexonline" do
  cwd "/dexonline"
  command "tools/setup"
  command "mysql -u root -e 'create database if not exists DEX character set utf8;'"
end
