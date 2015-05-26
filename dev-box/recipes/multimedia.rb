# spotify

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  key '94558F59'
  keyserver 'keyserver.ubuntu.com'
  arch node['dev-box']['arch']
end

package 'spotify-client'

# video playback

package ['ubuntu-restricted-extras', 'vlc']

# gimp

package ['gimp'] #, 'gimp-data', 'gimp-plugin-registry', 'gimp-data-extras']

# screenshots

apt_repository 'shutter' do
  uri 'http://ppa.launchpad.net/shutter/ppa/ubuntu'
  distribution node['dev-box']['distribution']
  components ['main']
  key '009ED615'
  keyserver 'keyserver.ubuntu.com'
  arch node['dev-box']['arch']
end
package 'shutter'



package ['libqtmultimediakit1', 'libqtmultimediakit1', 'libqxt-core0', 'libqxt-gui0', 'libquazip1'] # dependencies
remote_file "/tmp/screencloud_1.2.0-1_amd64.deb" do
  source "http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_14.04/amd64/screencloud_1.2.0-1_amd64.deb"
end
dpkg_package "screencloud" do
  options '--ignore-depends=libquazip0' # this was replaced in ubuntu 15.04 by libquazip1
  source "/tmp/screencloud_1.2.0-1_amd64.deb"
  action :install
end
