include_recipe 'rvm'

railslove_directory = "/home/#{node['dev-box']['user']}/railslove"

# make sure railslove directory exists
directory railslove_directory do
  owner node['dev-box']['user']
  action :create
end

railslove_chef_directory = "#{railslove_directory}/chef"

git "checkout chef repo" do
  repository "https://github.com/railslove/chef.git"
  revision "master"
  destination railslove_chef_directory
  user node['dev-box']['user']
  action :checkout
end

rvm_shell 'bundle install' do 
  # ruby_string ruby_version
  cwd railslove_chef_directory
  code 'bundle install'
  user node['dev-box']['user']
end

zshell_rcfile 'railslove_chef' do
  user node['dev-box']['user']
  content "export RAILSLOVE_KNIFE_USER=#{node['dev-box']['railslove_chef']['user']}"
  action :create
end

# create api credentials https://manage.brightbox.com/accounts/acc-j8kit/api_clients/
zshell_rcfile 'makerist_brighbox_api' do
  user node['dev-box']['user']
  content %Q(
    export BRIGHTBOX_CLIENTID=
    export BRIGHTBOX_SECRET_KEY=
  )
  action :create
end

