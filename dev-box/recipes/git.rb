include_recipe 'git'

cookbook_file "#{ENV['HOME']}/.gitconfig" do
  owner 'jk'
  action :create
  source ".gitconfig"
end