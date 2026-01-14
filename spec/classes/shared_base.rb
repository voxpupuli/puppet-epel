# frozen_string_literal: true

require 'spec_helper'

shared_examples 'base' do
  it do
    expect(subject).to contain_yumrepo('epel').with(
      proxy: 'absent',
      enabled: '1',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'base 10' do
  include_context 'base'

  it do
    expect(subject).to contain_yumrepo('epel').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-10&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-10',
      descr: 'Extra Packages for Enterprise Linux 10 - $basearch',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'base 9' do
  include_context 'base'

  it do
    expect(subject).to contain_yumrepo('epel').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - $basearch',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'base 8' do
  include_context 'base'

  it do
    expect(subject).to contain_yumrepo('epel').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - $basearch',
      failovermethod: 'absent'
    )
  end
end
