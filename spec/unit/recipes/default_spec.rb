#
# Cookbook Name:: trimmomatic
# Spec:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

require 'spec_helper'

describe 'trimmomatic::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  # default: make sure the converge works
  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  # make sure unzip is going to be installed as we need it to
  # extract the tool binaries
  it 'installs unzip' do
    expect(chef_run).to install_package 'unzip'
  end

  # make sure the java recipe is included, as this will
  # install the needed Java libraries for the tool
  it 'includes the `java` recipe' do
    expect(chef_run).to include_recipe('java')
  end

  it 'creates TRIMMOMATIC_JAR_PATH environment variable' do
    expect(chef_run).to add_magic_shell_environment('TRIMMOMATIC_JAR_PATH')
  end

  it 'creates TRIMMOMATIC_VERSION environment variable' do
    expect(chef_run).to add_magic_shell_environment('TRIMMOMATIC_VERSION')
  end
end
