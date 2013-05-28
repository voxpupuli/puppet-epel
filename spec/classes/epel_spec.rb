require 'spec_helper'

describe 'epel', :type => :class do
  context 'on EL system' do
    let(:facts) do
      {
        :osfamily       => 'RedHat',
        :os_maj_version => '6',
        :architecture   => 'x86_64'
      }
    end

    it 'should have the right yumrepos configured' do
      should contain_yumrepo('epel-testing').with({
        :baseurl        => 'http://download.fedora.redhat.com/pub/epel/testing/6/x86_64',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '0',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - Testing - x86_64 '
      })
      should contain_yumrepo('epel-testing-debuginfo').with({
        :baseurl        => 'http://download.fedora.redhat.com/pub/epel/testing/6/x86_64/debug',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '0',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - Testing - x86_64 - Debug'
      })
      should contain_yumrepo('epel-testing-source').with({
        :baseurl        => 'http://download.fedora.redhat.com/pub/epel/testing/6/SRPMS',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '0',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - Testing - x86_64 - Source'
      })
      should contain_yumrepo('epel').with({
        :mirrorlist     => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=x86_64',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '1',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - x86_64'
      })
      should contain_yumrepo('epel-debuginfo').with({
        :mirrorlist     => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-6&arch=x86_64',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '0',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - x86_64 - Debug'
      })
      should contain_yumrepo('epel-source').with({
        :mirrorlist     => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-6&arch=x86_64',
        :failovermethod => 'priority',
        :proxy          => 'absent',
        :enabled        => '0',
        :gpgcheck       => '1',
        :gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
        :descr          => 'Extra Packages for Enterprise Linux 6 - x86_64 - Source'
      })
    end

    it 'should contain the right gpg keys' do
      should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6')
      should contain_epel__rpm_gpg_key('EPEL-6').with_path('/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6')
    end
  end

  context 'on unsupported system' do
    let(:facts) do
      {
        :osfamily => 'Debian'
      }
    end

    it do
      should_not contain_yumrepo('epel')
    end
  end
end
