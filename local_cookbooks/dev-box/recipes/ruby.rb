
include_recipe 'rvm::user_install'

cookbook_file ".gemrc" do
  path "/home/jk/.gemrc"
  owner 'jk'
  action :create
  source '.gemrc'
end
