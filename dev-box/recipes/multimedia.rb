# spotify

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  distribution nil # had nothing for 'xenial'
  key 'D2C19886' # '94558F59'
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

# after install:  enable autostart
# Preferences > Behavior > First-launch behavior > Start shutter at login

package 'shutter'

