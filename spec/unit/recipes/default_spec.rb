#
# Cookbook:: lcd_web
# Spec:: default
#
# Copyright:: 2017, Brian Chau, All Rights Reserved.

require 'spec_helper'

describe 'lcd_web::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd' do
      expect { chef_run }.to install_package('httpd')
    end

    it 'enables httpd' do
      expect { chef_run }.to enable_service('httpd')
    end

    it 'starts and runs httpd' do
      expect { chef_run }.to start_service('httpd')
    end

    it 'installs net-tools' do
      expect { chef_run }.to install_package('net-tools')
    end
  end
end
