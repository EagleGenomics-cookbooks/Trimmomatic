# Tests to check if the infrastructure we expect is available

# we need to have unzip capabilities to extract the trimmomatic binaries
describe package 'unzip' do
  it { should be_installed }
end

# Check that Java was installed
describe command('which java') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/java} }
end

# Check that we have the correct version of Java
describe command('java -version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/1.8/) }
end

# Check that the trimmomatic installation directory was created successfully
describe file('/usr/local/Trimmomatic-0.36') do
  it { should be_directory }
end

# Check that the trimmomatic executable is where it should be
describe file('/usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar') do
  it { should be_file }
end

# Check that our tool works
describe command('java -jar /usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar -version') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(/0.36/) }
end

describe command('echo $TRIMMOMATIC_JAR_PATH') do
  its('stdout') { should match(/trimmomatic/) }
end
