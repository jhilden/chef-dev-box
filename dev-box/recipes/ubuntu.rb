execute "disable ubuntu remote product search" do
  command "gsettings set com.canonical.Unity.Lenses remote-content-search \\'none\\'"
  user node['dev-box']['user']
  group node['dev-box']['group']
end

execute "increase idle delay" do
  command "gsettings set org.gnome.desktop.session idle-delay 600" # 600 = 10 minutes * 60 seconds
  user node['dev-box']['user']
  group node['dev-box']['group']
end


# # you still need to enable workspaces manually using the setting GUI
# # All Settings > Appearance > Behavior
execute "enable 2x4 workspaces" do
  command "gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4 && gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2"
  user node['dev-box']['user']
  group node['dev-box']['group']
end


# high dpi

# execute 'increase font-size' do
#   command 'dconf write /com/canonical/unity/interface/text-scale-factor 1.2'
#   user node['dev-box']['user']
#   group node['dev-box']['group']
# end
# execute 'scaling-factor' do
#   command 'gsettings set org.gnome.desktop.interface scaling-factor 1.2'
#   user node['dev-box']['user']
#   group node['dev-box']['group']
# end
# execute 'text-scaling-factor' do
#   command 'gsettings set org.gnome.desktop.interface text-scaling-factor 1.2'
#   user node['dev-box']['user']
#   group node['dev-box']['group']
# end


ruby_block 'increase inotify user watches' do
  block do
    file = Chef::Util::FileEdit.new '/etc/sysctl.conf'
    file.insert_line_if_no_match /max_user_watches/, "fs.inotify.max_user_watches=100000"
    file.write_file
  end
  only_if do
    ::File.readlines('/etc/modprobe.d/iwlwifi.conf').grep(/max_user_watches/).none?
  end
end

# because of https://facebook.github.io/watchman/docs/install.html#system-specific-preparation
ruby_block 'increase inotify queue' do
  block do
    file = Chef::Util::FileEdit.new '/etc/sysctl.conf'
    file.insert_line_if_no_match /max_queued_events/, "fs.inotify.max_queued_events=32000"
    file.write_file
  end
end