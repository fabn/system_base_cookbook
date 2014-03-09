require 'spec_helper'

describe 'MySQL service configuration' do

  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command("sudo su -l -c 'mysqladmin processlist'") do
    it { should return_stdout /root | localhost.*show processlist/ }
    it { should return_exit_status 0 }
  end

end
