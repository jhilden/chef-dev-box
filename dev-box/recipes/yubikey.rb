
apt_repository 'yubico' do
  uri 'http://ppa.launchpad.net/yubico/stable/ubuntu'
  components ['main']
  distribution node['dev-box']['distribution']
  key '32CBA1A9'
  keyserver 'keyserver.ubuntu.com'
  arch node['dev-box']['arch']
  action :add
end

package ['yubikey-neo-manager']

# https://www.yubico.com/faq/enable-u2f-linux/
cookbook_file '/etc/udev/rules.d/70-u2f.rules' do
  owner 'root'
  action :create
end