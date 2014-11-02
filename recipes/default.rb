include_recipe "apt::default"
include_recipe "build-essential::default"
include_recipe "nginx::default"
include_recipe "runit::default"
include_recipe "docker::default"

# install required packages
node['stager']['packages'].each do |p|
  package p
end

# create directory for stager to be cloned to
directory node['stager']['path']['install'] do
  action :create
  owner  node['stager']['user']
  group  node['stager']['group']
  mode   775
end

# clone stager
git node['stager']['path']['install'] do
  action :sync
  repository node['stager']['repo']
  branch node['stager']['branch']
end

# set up reverse proxy for stager
template "/etc/nginx/sites-enabled/default" do
  action :create
  source "stager_default.vhost.erb"
  notifies :reload, "service[nginx]"
end

# hack, should use directory resource
execute "sudo chown -R root:docker /etc/nginx/sites-enabled && sudo chmod -R 775 /etc/nginx/sites-enabled"

# hack, should use sudo cookbook
execute "echo %docker ALL=NOPASSWD: /opt/stager/request_handlers/reload_nginx >> /etc/sudoers"

# install stager deps
execute "cd #{node['stager']['path']['install']} && bundle install"

# set up stager service
runit_service "stager" do
  log false
end
