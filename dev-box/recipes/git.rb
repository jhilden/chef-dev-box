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

# install "hub"

hub_file_name = "hub-linux-amd64-#{node['dev-box']['git']['hub']['version']}"
local_hub_tar_file = "/tmp/#{hub_file_name}.tgz"

remote_file local_hub_tar_file do
  source "https://github.com/github/hub/releases/download/v#{node['dev-box']['git']['hub']['version']}/#{hub_file_name}.tgz"
end

execute 'extract_hub' do
  command "tar xzvf #{local_hub_tar_file}"
  cwd '/usr/local/src'
  not_if { File.exists? "/usr/local/src/#{hub_file_name}" }
end

execute 'install_hub' do
  command "./install"
  cwd "/usr/local/src/#{hub_file_name}"
end