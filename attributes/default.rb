# attributes to override default behaviour of cookbook java
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# Trimmomatic attributes
default['Trimmomatic']['version'] = '0.36'
default['Trimmomatic']['install_dir'] = '/usr/local'
