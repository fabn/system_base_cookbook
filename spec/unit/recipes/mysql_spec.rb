require 'spec_helper'

describe 'system_base::mysql_config' do

  context 'when at least a package is specified' do

    let(:root_password) { 'supersecret' }

    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:mysql][:server_root_password] = root_password
        node.set[:mysql][:server_debian_password] = root_password
        node.set[:mysql][:server_repl_password] = root_password
      end.converge(described_recipe)
    end

    it 'should install utility packages' do
      expect(chef_run).to install_package('percona-toolkit')
    end

    it 'should configure passwordless root access' do
      expect(chef_run).to render_file('/root/.my.cnf').with_content(root_password)
    end

    %w(mysqltuner.pl tuning-primer.sh slave_status.sh).each do |tool|
      it "should install #{tool} tool into /usr/local/bin" do
        tool_binary = File.basename(tool, '.*')
        expect(chef_run).to create_remote_file("/usr/local/bin/#{tool_binary}")
      end
    end

  end

end