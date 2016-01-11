# "git clone  ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`"

git "checkout nvm" do
  repository "https://github.com/creationix/nvm.git"
  revision node['dev-box']['nvm']['version']
  destination "/home/#{node['dev-box']['user']}/.nvm"
  user node['dev-box']['user']
  action :checkout
end

execute 'install stable node version and make it default' do
  command 'nvm install stable && nvm alias default stable'
  user node['dev-box']['user']
  action :nothing
end

zshell_rcfile 'load_nvm' do
  user node['dev-box']['user']
  content "source /home/#{node['dev-box']['user']}/.nvm/nvm.sh"
  action :create
end

# zshell_rcfile 'local_npm_binaries' do
#   content "export PATH=./node_modules/.bin:./../node_modules/.bin:$PATH"
#   user node['dev-box']['user']
#   action :create
# end