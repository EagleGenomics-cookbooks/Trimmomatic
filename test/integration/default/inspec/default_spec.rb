# Tests to check if the infrastructure we expect is available



# we need to have unzip capabilities
describe package 'unzip' do
  it { should be_installed }
end

# describe os_env('TRIMMOMATIC_INSTALL_DIR') do
#   its('content') { should match /\/usr\/local\// }
# end

#describe file("#{ENV['TRIMMOMATIC_INSTALL_DIR']}/Trimmomatic") do
#  it { should be_directory }
#end
describe file("/usr/local/Trimmomatic-0.36") do
  it { should be_directory }
end

#describe file("#{ENV['TRIMMOMATIC_INSTALL_DIR']}/Trimmomatic/trimmomatic-#{ENV['TRIMMOMATIC_VERSION']}.jar") do
#  it { should be_file }
#end
describe file("/usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar") do
  it { should be_file }
end

describe command('which java') do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq "/usr/bin/java\n"}
  its('stdout') { should match /\/usr\/bin\/java/}
end

describe command('java -version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match /1.8/ }
#  its(:stdout) { should contain ENV['JAVA_VERSION'] }
end

describe command('java -jar /usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar -version') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match /0.36/ }
#  its(:stdout) { should contain ENV['JAVA_VERSION'] }
end

describe command('. /etc/profile') do
  its('exit_status') { should eq 0 }
end

describe command('. /etc/profile; env') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match /TRIMMOMATIC/ }
end

describe command('whoami') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match /kitchen/}
end
