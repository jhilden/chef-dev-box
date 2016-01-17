apt_repository 'btsync' do
  uri          'http://ppa.launchpad.net/tuxpoldo/btsync/ubuntu'
  distribution 'vivid' # there is no version for 'wily' yet, otherwise use: node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'D294A752'
end

package 'btsync'