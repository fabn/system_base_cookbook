require 'spec_helper'

describe 'System base executed recipes' do

  describe package('tree') do
    it { should be_installed }
  end

  describe command('which tree') do
    it { should return_stdout '/usr/bin/tree' }
  end

end