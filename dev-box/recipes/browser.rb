# -- chromium --

package ['chromium-browser'] #, 'chromium-codecs-ffmpeg']


# -- chrome --

apt_repository 'google-chrome-stable' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  distribution 'stable'
  components ['main']
  keyserver 'keys.gnupg.net'
  arch node['dev-box']['arch']
  key '7FAC5991'
  action :add
end

package ['google-chrome-stable']


# -- flash --

# http://www.webupd8.org/2014/05/install-fresh-player-plugin-in-ubuntu.html
# apt_repository 'webupd8' do
#   uri 'http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu'
#   components ['main']
#   distribution node['dev-box']['distribution']
#   key '4C9D234C'
#   keyserver 'keyserver.ubuntu.com'
#   arch node['dev-box']['arch']
#   action :add
# end

# package 'freshplayerplugin'



