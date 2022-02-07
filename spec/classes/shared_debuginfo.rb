# frozen_string_literal: true

require 'spec_helper'

shared_examples 'epel debuginfo' do
  it do
    expect(subject).to contain_yumrepo('epel-debuginfo').with(
      proxy: 'absent',
      enabled: '0',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'epel debuginfo 9' do
  include_context 'epel debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - $basearch - Debug',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel debuginfo 8' do
  include_context 'epel debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - $basearch - Debug',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel debuginfo 7' do
  include_context 'epel debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
      descr: 'Extra Packages for Enterprise Linux 7 - $basearch - Debug',
      failovermethod: 'priority'
    )
  end
end
