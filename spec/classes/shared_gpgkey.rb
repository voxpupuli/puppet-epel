require 'spec_helper'

shared_examples_for :gpgkey_8 do
  it do
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8').with(
      ensure: 'file',
      owner:  'root',
      group:  'root',
      mode:   '0644'
    )
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    is_expected.to contain_epel__rpm_gpg_key('EPEL-8').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8'
    )
  end
end

shared_examples_for :gpgkey_7 do
  it do
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7').with(
      ensure: 'file',
      owner:  'root',
      group:  'root',
      mode:   '0644'
    )
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    is_expected.to contain_epel__rpm_gpg_key('EPEL-7').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7'
    )
  end
end

shared_examples_for :gpgkey_6 do
  it do
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6').with(
      ensure: 'file',
      owner:  'root',
      group:  'root',
      mode:   '0644'
    )
    is_expected.to contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6').
      with_content(%r{BEGIN PGP PUBLIC KEY BLOCK})
  end

  it do
    is_expected.to contain_epel__rpm_gpg_key('EPEL-6').with(
      path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6'
    )
  end
end
