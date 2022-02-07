# frozen_string_literal: true

require 'spec_helper'

shared_examples 'epel testing debuginfo' do
  it do
    expect(subject).to contain_yumrepo('epel-testing-debuginfo').with(
      proxy: 'absent',
      enabled: '0',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'epel testing debuginfo 9' do
  include_context 'epel testing debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-testing-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - Testing - $basearch - Debug',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing debuginfo 8' do
  include_context 'epel testing debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-testing-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - Testing - $basearch - Debug',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing debuginfo 7' do
  include_context 'epel testing debuginfo'

  it do
    expect(subject).to contain_yumrepo('epel-testing-debuginfo').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel7&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
      descr: 'Extra Packages for Enterprise Linux 7 - Testing - $basearch - Debug',
      failovermethod: 'priority'
    )
  end
end
