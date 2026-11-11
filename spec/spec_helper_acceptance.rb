# frozen_string_literal: true

require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  host.install_package('yum-utils')
  host.install_package('gnupg2') if fact('os.release.major').to_i >= 10
end

shared_examples 'EPEL is available' do
  describe command('/usr/bin/dnf config-manager --dump epel') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel} }
  end

  describe command('dnf clean all') do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe command('dnf --disablerepo="*" --enablerepo="epel" list available') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{epel-release} }
  end

  # certbot's dependencies are built against the base OS, so this fails if EPEL serves a mismatched branch.
  describe command('dnf -y install --downloadonly certbot') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match %r{certbot} }
  end
end
