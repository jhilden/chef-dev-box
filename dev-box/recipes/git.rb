include_recipe 'git'

cookbook_file "/home/#{node['dev-box']['user']}/.gitconfig" do
  owner node['dev-box']['user']
  action :create
  source ".gitconfig"
end

cookbook_file "/home/#{node['dev-box']['user']}/.gitignore_global" do
  owner node['dev-box']['user']
  action :create
  source ".gitignore_global"
end