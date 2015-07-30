include_recipe 'java'

apt_repository "elasticsearch" do
  uri "http://packages.elastic.co/elasticsearch/1.4/debian"
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'elasticsearch'

ruby_block 'disable cluster settings for better local development' do
  block do
    file = Chef::Util::FileEdit.new '/etc/elasticsearch/elasticsearch.yml'
    file.search_file_replace_line "#index.number_of_shards: 1", "index.number_of_shards: 1"
    file.search_file_replace_line "#index.number_of_replicas: 0", "index.number_of_replicas: 0"
    file.write_file
  end
end

execute 'start on boot' do
  command "sudo update-rc.d elasticsearch defaults 95 10"
  only_if do
    ::File.exists?("/etc/init.d/elasticsearch")
  end
end