include_recipe "apt::default"
include_recipe "build-essential::default"
include_recipe "nginx::default"
include_recipe "runit::default"
include_recipe "docker::default"

node['stager']['packages'].each do |p|
  package p
end

directory node['stager']['path']['install'] do
  action :create
  owner  node['stager']['user']
  group  node['stager']['group']
  mode   775
end

git node['stager']['path']['install'] do
  action :sync
  repository node['stager']['repo']
  branch node['stager']['branch']
end

#hack, should use directory resource
execute "sudo chown -R root:docker /etc/nginx/sites-enabled && sudo chmod -R 775 /etc/nginx/sites-enabled"

template "/etc/nginx/sites-enabled/default" do
  action :create
  source "stager_default.vhost.erb"
  notifies :reload, "service[nginx]"
end

execute "echo %docker ALL=NOPASSWD: /opt/stager/request_handlers/reload_nginx >> /etc/sudoers"

execute "cd #{node['stager']['path']['install']} && bundle install"

runit_service "stager" do
  log false
end
