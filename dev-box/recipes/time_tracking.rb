include_recipe 'rvm'

projects_directory = "/home/#{node['dev-box']['user']}/projects"

# make sure projects directory exists
directory projects_directory do
  owner node['dev-box']['user']
  action :create
end

git "checkout frecklinghamster repo" do
  repository "https://github.com/jhilden/frecklinghamster.git"
  revision "master"
  destination "#{projects_directory}/frecklinghamster"
  user node['dev-box']['user']
  action :checkout
end

frecklinghamster_directory = "#{projects_directory}/frecklinghamster"

# execute 'bundle install' do
#   cwd frecklinghamster_directory
#   user node['dev-box']['user']
# end
rvm_shell 'bundle install' do 
  # ruby_string ruby_version
  cwd frecklinghamster_directory
  code 'bundle install'
  user node['dev-box']['user']
end 

cookbook_file "freckle database config" do
  path "#{frecklinghamster_directory}/config/database.yml"
  owner node['dev-box']['user']
  action :create
  source 'private/freckle_database.yml'
end

cookbook_file "freckle initializer" do
  path "#{frecklinghamster_directory}/config/initializers/freckle.rb"
  owner node['dev-box']['user']
  action :create
  source 'private/freckle.rb'
end

# ------- hamster -------

# hamster_directory = "/home/#{node['dev-box']['user']}/tools/hamster"

# # prerequisites
# package ['git-core', 'gettext', 'intltool', 'python-gconf', 'python-xdg']

# git 'checkout hamster repo' do
#   repository "https://github.com/projecthamster/hamster.git"
#   revision "hamster-time-tracker-1.04"
#   user node['dev-box']['user']
#   action :checkout
#   destination hamster_directory
# end

# execute "configure hamster" do
#   command './waf configure build --prefix=/usr'
#   cwd hamster_directory
#   user node['dev-box']['user']
#   action :run
#   notifies :run, 'execute[install_hamster]', :immediately
#   not_if do
#     ::Dir.exists? hamster_directory
#   end
# end

# execute "install_hamster" do
#   command './waf install' # as sudo
#   cwd hamster_directory
#   action :nothing
# end



apt_repository 'hamster-time-tracker' do
  uri 'http://ppa.launchpad.net/dylanmccall/hamster-time-tracker-git-daily/ubuntu'
  distribution 'utopic'
  components ['main']
  key '519AE6BB'
  keyserver 'keyserver.ubuntu.com'
  arch node['dev-box']['arch']
end
package 'hamster-time-tracker'