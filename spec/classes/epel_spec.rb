require 'spec_helper'

%w{ 6.4 5.9 }.each do |os_version|
  os_maj_version = os_version.split('.')[0]

  describe 'epel' do
    include_context :default_facts

    let :facts do
      {
        :operatingsystemrelease => os_version,
        :os_maj_version         => os_maj_version,
      }.merge(default_facts)
    end

    it { should contain_class('epel::params') }

    it do
      should contain_yumrepo('epel-testing').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/#{os_maj_version}/#{facts[:architecture]}",
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - Testing - #{facts[:architecture]} ",
      })
    end

    it do
      should contain_yumrepo('epel-testing-debuginfo').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/#{os_maj_version}/#{facts[:architecture]}/debug",
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - Testing - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-testing-source').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/#{os_maj_version}/SRPMS",
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - Testing - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_yumrepo('epel').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{os_maj_version}&arch=#{facts[:architecture]}",
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '1',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - #{facts[:architecture]}",
      })
    end

    it do
      should contain_yumrepo('epel-debuginfo').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-#{os_maj_version}&arch=#{facts[:architecture]}",
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-source').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-#{os_maj_version}&arch=#{facts[:architecture]}",
        'proxy'          => 'absent',
        'failovermethod' => 'priority',
        'enabled'        => '0',
        'gpgcheck'       => '1',
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}",
        'descr'          => "Extra Packages for Enterprise Linux #{os_maj_version} - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_file("/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}").with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => "puppet:///modules/epel/RPM-GPG-KEY-EPEL-#{os_maj_version}",
      })
    end

    it do
      should contain_epel__rpm_gpg_key("EPEL-#{os_maj_version}").with({
        'path' => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}"
      })
    end
  end
end
