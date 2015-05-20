#
# Cookbook Name:: sublime-text
# Recipe:: default
#
# Copyright (C) 2014 Patrick Ayoup
#
# MIT License
#

apt_repository "sublime-text-#{node['version']}" do
  uri node['sublime-text']['repository']['uri']
  components ['main']
  distribution node['sublime-text']['platform']['release']
  arch node['sublime-text']['platform']['architecture']
  keyserver node['sublime-text']['repository']['keyserver']
  key node['sublime-text']['repository']['key']
end

package 'sublime-text'
