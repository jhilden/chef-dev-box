
include_recipe 'rvm::user_install'

# still need to set default ruby
# $ rvm --default use 2.2.1

cookbook_file ".gemrc" do
  path "/home/jk/.gemrc"
  owner 'jk'
  action :create
  source '.gemrc'
end
