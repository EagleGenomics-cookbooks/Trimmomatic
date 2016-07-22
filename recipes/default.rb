#
# Cookbook Name:: Trimmomatic
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

include_recipe 'java'

##########################################################

package ['unzip'] do
  action :install
end

##########################################################

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Trimmomatic']['file_name']}" do
  source node['Trimmomatic']['download_url']
  action :create_if_missing
end

execute "unzip #{Chef::Config[:file_cache_path]}/#{node['Trimmomatic']['file_name']} -d #{node['Trimmomatic']['install_dir']}" do
  not_if { ::File.exist?("#{node['Trimmomatic']['install_dir']}/#{node['Trimmomatic']['file_base']}/LICENSE") }
end
