include_recipe 'apt::default' # for apt-get update resource

execute 'enable canonical partner repos' do
  command 'sed -i "/^# deb.*partner/ s/^# //" /etc/apt/sources.list'
  notifies :run, 'execute[apt-get update]', :immediately
  only_if do
    ::File.readlines('/etc/apt/sources.list').grep(/^# deb.*partner$/).any?
  end
end

package 'skype'