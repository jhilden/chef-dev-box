#
# Cookbook Name:: sublime-text
# Attributes:: default
#
# Copyright (C) 2014 Patrick Ayoup
#
# MIT License
#

default['sublime-text']['version'] = 2

default['sublime-text']['platform']['release'] = 'trusty'
default['sublime-text']['platform']['architecture'] = 'amd64'

default['sublime-text']['repository']['uri'] = "http://ppa.launchpad.net/webupd8team/sublime-text-#{node['sublime-text']['version']}/ubuntu"
default['sublime-text']['repository']['keyserver'] = 'keyserver.ubuntu.com'
default['sublime-text']['repository']['key'] = 'EEA14886'