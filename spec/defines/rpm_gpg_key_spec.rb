require 'spec_helper'

describe 'epel::rpm_gpg_key' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'RedHat',
        'operatingsystemrelease' => %w[5 6 7 8]
      }
    ]
  }
  on_supported_os(test_on).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:operatingsystemmajrelease]
      when '5'
        let :title do
          'EPEL-5'
        end
        let :pre_condition do
          'file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5": }'
        end
        let :params do
          { path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-5' }
        end

      when '6'
        let :title do
          'EPEL-6'
        end
        let :pre_condition do
          'file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6": }'
        end
        let :params do
          { path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6' }
        end

      when '7'
        let :title do
          'EPEL-7'
        end
        let :pre_condition do
          'file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7": }'
        end
        let :params do
          { path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7' }
        end

      when '8'
        let :title do
          'EPEL-8'
        end
        let :pre_condition do
          'file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8": }'
        end
        let :params do
          { path: '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8' }
        end

      end
      it do
        is_expected.to contain_exec("import-#{title}").with(
          path:      '/bin:/usr/bin:/sbin:/usr/sbin',
          command:   "rpm --import #{params[:path]}",
          unless:    "rpm -q gpg-pubkey-$(echo $(gpg -q --batch --with-colons --throw-keyids --keyid-format short < #{params[:path]}) | grep pub | cut -d ':' -f 5 | cut --characters=9- | tr '[A-Z]' '[a-z]')",
          require:   "File[#{params[:path]}]",
          logoutput: 'on_failure'
        )
      end
    end
  end
end
