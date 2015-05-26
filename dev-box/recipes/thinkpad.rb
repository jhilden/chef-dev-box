# http://askubuntu.com/questions/599477/lenovo-x1-carbon-2015-3rd-gen-20-bs-trackpoint-clickpad-and-wifi

# wifi

ruby_block 'disable 11n wifi' do
  block do
    file = Chef::Util::FileEdit.new '/etc/modprobe.d/iwlwifi.conf'
    file.insert_line_if_no_match /11n_disable/, "options iwlwifi 11n_disable=1"
    file.write_file
  end
  notifies :run, 'execute[update_initramfs]', :delayed
  only_if do
    ::File.readlines('/etc/modprobe.d/iwlwifi.conf').grep(/11n_disable/).none?
  end
end


# acpi and function buttons

puts 'installing thinkpad_acpi'

package 'tp-smapi-dkms' do
  action :install
end

cookbook_file "/etc/modules-load.d/thinkpad_acpi.conf" do
  owner 'root'
  action :create
  source 'thinkpad_acpi.conf'
  notifies :run, 'execute[update_initramfs]', :delayed
end


# update initramfs if necessary

execute 'update_initramfs' do
  # TODO:  better way to output the reboot message
  command 'update-initramfs -u && echo "YOU WILL NEED TO REBOOT YOUR SYSTEM"'
  action :nothing # should only run on notification
end