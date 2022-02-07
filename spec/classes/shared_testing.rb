# frozen_string_literal: true

require 'spec_helper'

shared_examples 'epel testing' do
  it do
    expect(subject).to contain_yumrepo('epel-testing').with(
      proxy: 'absent',
      enabled: '0',
      gpgcheck: '1',
      repo_gpgcheck: '0'
    )
  end
end

shared_examples_for 'epel testing 9' do
  include_context 'epel testing'

  it do
    expect(subject).to contain_yumrepo('epel-testing').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel9&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9',
      descr: 'Extra Packages for Enterprise Linux 9 - Testing - $basearch',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing 8' do
  include_context 'epel testing'

  it do
    expect(subject).to contain_yumrepo('epel-testing').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel8&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr: 'Extra Packages for Enterprise Linux 8 - Testing - $basearch',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for 'epel testing 7' do
  include_context 'epel testing'

  it do
    expect(subject).to contain_yumrepo('epel-testing').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=$basearch',
      gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
      descr: 'Extra Packages for Enterprise Linux 7 - Testing - $basearch',
      failovermethod: 'priority'
    )
  end
end
