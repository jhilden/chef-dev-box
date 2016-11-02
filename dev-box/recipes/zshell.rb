include_recipe 'zshell::default'

zshell_antigen 'jk' do
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'robbyrussell'
  bundle [ 'git', 'bundler' ]
  action :enable
end

# getting the REAL antigen.zsh
# cookbook seems to be broken with that
# (and generally unmaintained)
remote_file "/home/#{node['dev-box']['user']}/.antigen/antigen.zsh" do
  source 'https://cdn.rawgit.com/zsh-users/antigen/v1.2.1/bin/antigen.zsh'
  owner node['dev-box']['user']
  mode '0644'
  action :create
end