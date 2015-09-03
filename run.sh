#!/usr/bin/ruby -w

system 'rm -rf cookbooks' # remove previous cookbooks

system 'berks vendor cookbooks' # vendor cookbooks

system 'sudo chef-client -c client.rb'