require 'spec_helper'

shared_examples :epel_debuginfo do
  it do
    is_expected.to contain_yumrepo('epel-debuginfo').with(
      proxy:          'absent',
      enabled:        '0',
      gpgcheck:       '1',
      repo_gpgcheck:  '0'
    )
  end
end

shared_examples_for :epel_debuginfo_8 do
  include_context :epel_debuginfo

  it do
    is_expected.to contain_yumrepo('epel-debuginfo').with(
      mirrorlist:     'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-8&arch=$basearch',
      gpgkey:         'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr:          'Extra Packages for Enterprise Linux 8 - $basearch - Debug',
      failovermethod: 'absent'
    )
  end
end

shared_examples_for :epel_debuginfo_7 do
  include_context :epel_debuginfo

  it do
    is_expected.to contain_yumrepo('epel-debuginfo').with(
      mirrorlist:     'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch',
      gpgkey:         'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
      descr:          'Extra Packages for Enterprise Linux 7 - $basearch - Debug',
      failovermethod: 'priority'
    )
  end
end

shared_examples_for :epel_debuginfo_6 do
  include_context :epel_debuginfo

  it do
    is_expected.to contain_yumrepo('epel-debuginfo').with(
      mirrorlist:     'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch',
      gpgkey:         'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
      descr:          'Extra Packages for Enterprise Linux 6 - $basearch - Debug',
      failovermethod: 'priority'
    )
  end
end
