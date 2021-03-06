include_recipe 'sublime-text::default'

sublime_folder = "/home/#{node['dev-box']['user']}/.config/sublime-text-3"

# make sure sublime Packages/User directory exists
directory "#{sublime_folder}/Packages/User" do
  owner node['dev-box']['user']
  action :create
end

# settings
cookbook_file "sublime user settings" do
  path "#{sublime_folder}/Packages/User/Preferences.sublime-settings"
  owner node['dev-box']['user']
  action :create
  source 'sublime/Preferences.sublime-settings'
end

# keyboard shortcuts
cookbook_file "sublime user keyboard shortcuts" do
  path "#{sublime_folder}/Packages/User/Default (Linux).sublime-keymap"
  owner node['dev-box']['user']
  action :create
  source 'sublime/Default(Linux).sublime-keymap'
end

# license
cookbook_file "sublime license" do
  path "#{sublime_folder}/Local/License.sublime_license"
  owner node['dev-box']['user']
  action :create
  source 'private/License.sublime_license'
end

# install package manager

remote_file 'package control' do
  source 'https://packagecontrol.io/Package%20Control.sublime-package'
  action :create
  path "#{sublime_folder}/Installed Packages/Package Control.sublime-package"
end

cookbook_file "sublime user package control settings" do
  path "#{sublime_folder}/Packages/User/Package Control.sublime-settings"
  owner node['dev-box']['user']
  action :create
  source 'sublime/PackageControl.sublime-settings'
end



# ---- fix up Sass syntax highlighting ----
# disassociate .sass from 'Ruby Haml' syntax
cookbook_file "Ruby Haml.sublime-settings" do
  path "#{sublime_folder}/Packages/User/Ruby Haml.sublime-settings"
  owner node['dev-box']['user']
  action :create
  source 'sublime/RubyHaml.sublime-settings'
end
# associate .sass with 'Sass' syntax
cookbook_file "Sass.sublime-settings" do
  path "#{sublime_folder}/Packages/User/Sass.sublime-settings"
  owner node['dev-box']['user']
  action :create
  source 'sublime/Sass.sublime-settings'
end

