include_recipe 'nvm'

nvm_install '0.12'  do
  from_source false
  alias_as_default true
  action :create
end

zshell_rcfile 'nvm' do
  user node['dev-box']['user']
  content node['nvm']['source']
  action :create
end