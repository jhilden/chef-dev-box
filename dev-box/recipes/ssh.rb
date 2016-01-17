cookbook_file "/home/#{node['dev-box']['user']}/.ssh/config" do
  owner node['dev-box']['user']
  action :create
  source "ssh_config"
end