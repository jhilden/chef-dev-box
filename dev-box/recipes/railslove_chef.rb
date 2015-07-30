include_recipe 'rvm'

railslove_directory = "/home/#{node['dev-box']['user']}/railslove"

# make sure railslove directory exists
directory railslove_directory do
  owner node['dev-box']['user']
  action :create
end

railslove_chef_directory = "#{railslove_directory}/chef"

# git "checkout chef repo" do
#   repository "https://github.com/railslove/chef.git"
#   revision "master"
#   destination railslove_chef_directory
#   user node['dev-box']['user']
#   action :checkout
# end

# see https://github.com/railslove/chef/blob/master/README.md

# rvm_shell 'bundle install' do 
#   # ruby_string ruby_version
#   cwd railslove_chef_directory
#   code 'bundle install'
#   user node['dev-box']['user']
# end

# rvm_shell 'berks install' do 
#   # ruby_string ruby_version
#   cwd railslove_chef_directory
#   code 'bundle exec berks install'
#   user node['dev-box']['user']
# end

zshell_rcfile 'railslove_chef' do
  user node['dev-box']['user']
  content "export RAILSLOVE_KNIFE_USER=#{node['dev-box']['railslove_chef']['user']}"
  action :create
end

# create api credentials https://manage.brightbox.com/accounts/acc-j8kit/api_clients/
zshell_rcfile 'makerist_brighbox_api' do
  user node['dev-box']['user']
  content %Q(
    export BRIGHTBOX_CLIENTID=#{node['dev-box']['makerist']['brightbox']['api_client_id']}
    export BRIGHTBOX_SECRET_KEY=#{node['dev-box']['makerist']['brightbox']['api_client_secret']}
  )
  action :create
end

cookbook_file "user pem" do
  path "#{railslove_chef_directory}/.chef/user-#{node['dev-box']['railslove_chef']['user']}.pem"
  owner 'jk'
  action :create
  source "private/user-#{node['dev-box']['railslove_chef']['user']}.pem"
end

cookbook_file "client pem" do
  path "#{railslove_chef_directory}/.chef/client-#{node['dev-box']['railslove_chef']['user']}.pem"
  owner 'jk'
  action :create
  source "private/client-#{node['dev-box']['railslove_chef']['user']}.pem"
end

# symlink
link "#{railslove_chef_directory}/.chef/knife.rb" do
  to "#{railslove_chef_directory}/.chef/knife-railslove.rb"
end

