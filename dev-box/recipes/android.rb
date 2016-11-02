include_recipe 'java'

tools_folder = "/home/#{node['dev-box']['user']}/tools"

# ensure tools directory presence
directory tools_folder do
  owner node['dev-box']['user']
  action :create
end

# download
local_android_sdk_tar = '/tmp/android-sdk.tgz'
remote_file local_android_sdk_tar do
  source "http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz"
  user node['dev-box']['user']
end

# unzip
execute 'extract_android-sdk' do
  command "tar xzvf #{local_android_sdk_tar}"
  cwd tools_folder
  user node['dev-box']['user']
  not_if { File.exists? "#{tools_folder}/android-sdk-linux" }
end

# ENV vars
zshell_rcfile 'android_sdk' do
  user node['dev-box']['user']
  content %Q(
    export ANDROID_HOME=#{tools_folder}/android-sdk-linux/
    export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
  )
  action :create
end

# KVM for more performanace
package ['qemu-kvm', 'qemu-system']