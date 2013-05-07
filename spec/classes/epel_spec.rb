require 'spec_helper'

describe 'epel' do
  shared_examples :operatingsystem_release_independant do
    it { should contain_class('epel::params') }

    it do
      should contain_yumrepo('epel-testing').with({
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
      })
    end

    it do
      should contain_yumrepo('epel-testing-debuginfo').with({
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
      })
    end

    it do
      should contain_yumrepo('epel-testing-source').with({
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
      })
    end

    it do
      should contain_yumrepo('epel').with({
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '1',
        'gpgcheck'       => '1',
      })
    end

    it do
      should contain_yumrepo('epel-debuginfo').with({
        'failovermethod' => 'priority',
        'proxy'          => 'absent',
        'enabled'        => '0',
        'gpgcheck'       => '1',
      })
    end

    it do
      should contain_yumrepo('epel-source').with({
        'proxy'          => 'absent',
        'failovermethod' => 'priority',
        'enabled'        => '0',
        'gpgcheck'       => '1',
      })
    end
  end

  context 'os_maj_version => 6' do
    include_context :default_facts
    it_behaves_like :operatingsystem_release_independant

    let :facts do
      {
        :operatingsystemrelease => '6.4',
        :os_maj_version         => '6',
      }.merge(default_facts)
    end

    it do
      should contain_yumrepo('epel-testing').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/6/#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - Testing - #{facts[:architecture]} ",
      })
    end

    it do
      should contain_yumrepo('epel-testing-debuginfo').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/6/#{facts[:architecture]}/debug",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - Testing - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-testing-source').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/6/SRPMS",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - Testing - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_yumrepo('epel').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - #{facts[:architecture]}",
      })
    end

    it do
      should contain_yumrepo('epel-debuginfo').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-6&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-source').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-6&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
        'descr'          => "Extra Packages for Enterprise Linux 6 - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_file("/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6").with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => "puppet:///modules/epel/RPM-GPG-KEY-EPEL-6",
      })
    end

    it do
      should contain_epel__rpm_gpg_key("EPEL-6").with({
        'path' => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6"
      })
    end
  end

  context 'os_maj_version => 5' do
    include_context :default_facts
    it_behaves_like :operatingsystem_release_independant

    let :facts do
      {
        :operatingsystemrelease => '5.9',
        :os_maj_version         => '5',
      }.merge(default_facts)
    end

    it do
      should contain_yumrepo('epel-testing').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/5/#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - Testing - #{facts[:architecture]} ",
      })
    end

    it do
      should contain_yumrepo('epel-testing-debuginfo').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/5/#{facts[:architecture]}/debug",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - Testing - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-testing-source').with({
        'baseurl'        => "http://download.fedora.redhat.com/pub/epel/testing/5/SRPMS",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - Testing - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_yumrepo('epel').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - #{facts[:architecture]}",
      })
    end

    it do
      should contain_yumrepo('epel-debuginfo').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-5&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - #{facts[:architecture]} - Debug",
      })
    end

    it do
      should contain_yumrepo('epel-source').with({
        'mirrorlist'     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-5&arch=#{facts[:architecture]}",
        'gpgkey'         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5",
        'descr'          => "Extra Packages for Enterprise Linux 5 - #{facts[:architecture]} - Source",
      })
    end

    it do
      should contain_file("/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5").with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => "puppet:///modules/epel/RPM-GPG-KEY-EPEL-5",
      })
    end

    it do
      should contain_epel__rpm_gpg_key("EPEL-5").with({
        'path' => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5"
      })
    end
  end
end