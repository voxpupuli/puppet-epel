require 'spec_helper'

shared_examples :epel_playground do
  it do
    is_expected.to contain_yumrepo('epel-playground').with(
      failovermethod: 'priority',
      proxy:          'absent',
      enabled:        '0',
      gpgcheck:       '1',
      repo_gpgcheck:  '0'
    )
  end
end

shared_examples_for :epel_playground_8 do
  include_context :epel_playground

  it do
    is_expected.to contain_yumrepo('epel-playground').with(
      mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=playground-epel8&arch=$basearch',
      gpgkey:     'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8',
      descr:      'Extra Packages for Enterprise Linux 8 - $basearch - Playground'
    )
  end
end
