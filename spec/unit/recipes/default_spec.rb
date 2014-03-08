require 'spec_helper'

describe 'system_base::default' do

  context 'when at least a package is specified' do

    let(:simple_package) { {name: 'wget'} }
    let(:versioned_package) { {name: 'curl', version: '1.2.3'} }

    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:system_base][:packages] = [simple_package, versioned_package]
      end.converge(described_recipe)
    end

    it 'should include recipe apt::default in debian platform family' do
      expect(chef_run).to include_recipe('apt::default')
    end

    it 'should install packages specified with names only' do
      expect(chef_run).to install_package(simple_package[:name])
    end

    it 'should install packages locked at specific version' do
      expect(chef_run).to install_package(versioned_package[:name])
                          .with_version(versioned_package[:version])
    end

  end

end