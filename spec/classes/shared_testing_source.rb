# frozen_string_literal: true

require 'spec_helper'

shared_examples 'epel testing source' do
  it do
    expect(subject).to contain_yumrepo('epel-testing-source').with(
      proxy: 'absent',
      enabled: '0',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'epel testing source 10' do
  include_context 'epel testing source'

  it do
    expect(subject).to contain_yumrepo('epel-testing-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel10&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-10',
      descr: 'Extra Packages for Enterprise Linux 10 - Testing - $basearch - Source',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing source 9' do
  include_context 'epel testing source'

  it do
    expect(subject).to contain_yumrepo('epel-testing-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - Testing - $basearch - Source',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing source 8' do
  include_context 'epel testing source'

  it do
    expect(subject).to contain_yumrepo('epel-testing-source').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - Testing - $basearch - Source',
      failovermethod: 'absent'
    )
  end
end
