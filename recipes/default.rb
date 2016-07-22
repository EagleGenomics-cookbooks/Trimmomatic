#
# Cookbook Name:: Trimmomatic
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

# include_recipe 'build-essential'
include_recipe 'java'

##########################################################
# here for use by serverspec

magic_shell_environment 'JAVA_VERSION' do
  value "1.#{node['java']['jdk_version']}"
end

magic_shell_environment 'TRIMMOMATIC_INSTALL_DIR' do
  value node['Trimmomatic']['install_dir']
end

magic_shell_environment 'TRIMMOMATIC_VERSION' do
  value node['Trimmomatic']['version']
end

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

# execute 'chmod 755 fastqc' do
#  cwd "#{node['FastQC']['install_dir']}/FastQC/"
# end

# link "#{node['FastQC']['bin_path']}/fastqc" do
#  to "#{node['FastQC']['install_dir']}/FastQC/fastqc"
# end

##########################################################
