require 'spec_helper'

describe 'epel::rpm_gpg_key', :type => :define do
  let(:title) do
    'EPEL-6'
  end
  let(:params) do
    { :path  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6' }
  end

  it do
    should contain_exec('import-EPEL-6').with({
      :path      => '/bin:/usr/bin:/sbin:/usr/sbin',
      :command   => 'rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
      :unless    => 'rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6) | cut --characters=11-18 | tr [A-Z] [a-z])',
      :logoutput => 'on_failure'
    })
  end
end