
include_recipe 'rvm::user_install'

# still need to set default ruby
# $ rvm --default use 2.2.1

cookbook_file ".gemrc" do
  path "/home/jk/.gemrc"
  owner 'jk'
  action :create
  source '.gemrc'
end

# http://www.michaelrigart.be/en/blog/easily-publish-your-ruby-gems.html
cookbook_file "rubygems credentials" do
  path "/home/jk/.gem/credentials"
  owner 'jk'
  action :create
  source 'private/rubygems_credentials.yml'
end

zshell_rcfile 'bundler_editor' do
  user node['dev-box']['user']
  content "export BUNDLER_EDITOR=subl"
  action :create
end
