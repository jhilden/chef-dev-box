apt_repository 'dropbox' do
  uri 'http://linux.dropbox.com/ubuntu'
  components ['main']
  distribution node['dev-box']['distribution']
  key '5044912E'
  keyserver 'pgp.mit.edu'
end

package ['python-gpgme', 'dropbox'] #, 'nautilus-dropbox']