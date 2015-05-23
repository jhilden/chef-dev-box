include_recipe 'sublime-text::default'

# settings
cookbook_file "sublime user settings" do
  path "/home/jk/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
  owner 'jk'
  action :create
  source 'sublime/Preferences.sublime-settings'
end

# keyboard shortcuts
cookbook_file "sublime user settings" do
  path "/home/jk/.config/sublime-text-3/Packages/User/Default(Linux).sublime-keymap"
  owner 'jk'
  action :create
  source 'sublime/Default(Linux).sublime-keymap'
end
# need to rename file because CHEF support no spaces in filenames :(
execute 'mv Default\(Linux\).sublime-keymap Default\ \(Linux\).sublime-keymap' do
  cwd '/home/jk/.config/sublime-text-3/Packages/User/'
end

# license
cookbook_file "sublime license" do
  path "/home/jk/.config/sublime-text-3/Local/License.sublime_license"
  owner 'jk'
  action :create
  source 'sublime/License.sublime_license'
end
