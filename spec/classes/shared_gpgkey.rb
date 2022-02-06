# frozen_string_literal: true

require 'spec_helper'

shared_examples_for 'gpgkey 9' do
  it do
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9').with(
      ensure: 'file',
      owner: 'root',
      group: 'root',
      mode: '0644'
    )
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    expect(subject).to contain_epel__rpm_gpg_key('EPEL-9').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9'
    )
  end
end

shared_examples_for 'gpgkey 8' do
  it do
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8').with(
      ensure: 'file',
      owner: 'root',
      group: 'root',
      mode: '0644'
    )
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    expect(subject).to contain_epel__rpm_gpg_key('EPEL-8').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8'
    )
  end
end

shared_examples_for 'gpgkey 7' do
  it do
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7').with(
      ensure: 'file',
      owner: 'root',
      group: 'root',
      mode: '0644'
    )
    expect(subject).to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    expect(subject).to contain_epel__rpm_gpg_key('EPEL-7').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7'
    )
  end
end
