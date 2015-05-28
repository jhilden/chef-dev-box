package 'ubuntu-make'

execute 'install android studio' do
  # this doesn't work on the command line yet
  # command "umake android --accept-license /home/#{node['dev-box']['user']}/tools/android/android-studio"
  command "echo \"run '$ umake anroid' to install\""
end

# run ~/tools/android/android-studio/bin/studio.sh

zshell_rcfile 'android_sdk' do
  user node['dev-box']['user']
  content %Q(
    export ANDROID_HOME=/home/#{node['dev-box']['user']}/tools/android/sdk
    export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
  )
  action :create
end

# KVM for more performanace
# sudo apt-get install qemu-kvm qemu-system