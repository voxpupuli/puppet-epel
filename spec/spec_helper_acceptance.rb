# frozen_string_literal: true

require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  host.install_package('yum-utils')
  host.install_package('gnupg2') if fact('os.release.major').to_i >= 10
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
  command = if fact('os.release.major').to_i >= 8
              '/usr/bin/dnf config-manager --dump epel'
            else
              '/usr/bin/yum-config-manager epel'
            end
  describe command(command) do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel} }
  end

  yum_command = fact('os.release.major').to_i >= 8 ? 'dnf' : 'yum'
  describe command("#{yum_command} clean all") do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe command("#{yum_command} --disablerepo=\"*\" --enablerepo=\"epel\" list available") do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel-release} }
  end
end
