require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  c.formatter = :documentation

  c.before :suite do
    install_module
    install_module_dependencies

    hosts.each do |host|
      host.install_package('yum-utils')
    end
  end
end

shared_examples 'an idempotent manifest' do
  it 'applies with no errors' do
    apply_manifest(pp, catch_failures: true)
  end

  it 'applies a second time without changes' do
    apply_manifest(pp, catch_changes: true)
  end
end

shared_examples 'EPEL is available' do
  command = if fact('os.release.major') == '8'
              '/usr/bin/yum-config-manager --dump epel'
            else
              '/usr/bin/yum-config-manager epel'
            end
  describe command(command) do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel} }
  end
  describe command('yum clean all') do
    its(:exit_status) { is_expected.to eq 0 }
  end
  describe command('yum --disablerepo="*" --enablerepo="epel" list available') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel-release} }
  end
end
