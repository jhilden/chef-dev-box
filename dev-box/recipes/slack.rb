
remote_file "/tmp/slack-desktop.deb" do
  source "https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-#{node['dev-box']['arch']}.deb"
  mode 0644
end

dpkg_package "slack-desktop" do
  source "/tmp/slack-desktop.deb"
  action :install
end
