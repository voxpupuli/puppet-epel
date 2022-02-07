# frozen_string_literal: true

require 'spec_helper'

shared_examples 'epel source' do
  it do
    expect(subject).to contain_yumrepo('epel-source').with(
      proxy: 'absent',
      enabled: '0',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'epel source 9' do
  include_context 'epel source'

  it do
    expect(subject).to contain_yumrepo('epel-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - $basearch - Source',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel source 8' do
  include_context 'epel source'

  it do
    expect(subject).to contain_yumrepo('epel-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - $basearch - Source',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel source 7' do
  include_context 'epel source'

  it do
    expect(subject).to contain_yumrepo('epel-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
      descr: 'Extra Packages for Enterprise Linux 7 - $basearch - Source',
      failovermethod: 'priority'
    )
  end
end
