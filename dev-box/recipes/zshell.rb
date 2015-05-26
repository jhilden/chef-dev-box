include_recipe 'zshell::default'

zshell_antigen 'jk' do
  completion_waiting_dots true
  use [ 'oh-my-zsh' ]
  theme 'robbyrussell'
  bundle [ 'git', 'bundler' ]
  action :enable
end