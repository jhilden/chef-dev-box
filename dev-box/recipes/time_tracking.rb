frecklinghamster_directory = "/home/#{node['dev-box']['user']}/projects"

directory frecklinghamster_directory do
  owner node['dev-box']['user']
  action :create
end

git "checkout repo" do
  repository "git@github.com:jhilden/frecklinghamster.git"
  reference "master"
  destination frecklinghamster_directory
  user node['dev-box']['user']
  action :checkout
end

frecklinghamster_directory += "/frecklinghamster"

execute 'bundle install' do
  cwd frecklinghamster_directory
  user node['dev-box']['user']
end

cookbook_file "freckle database config" do
  path "#{frecklinghamster_directory}/config/database.yml"
  owner node['dev-box']['user']
  action :create
  source 'private/freckle_datbase.yml'
end

cookbook_file "freckle initializer" do
  path "#{frecklinghamster_directory}/config/freckle.rb"
  owner node['dev-box']['user']
  action :create
  source 'private/freckle.rb'
end