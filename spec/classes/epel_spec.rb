# frozen_string_literal: true

require 'spec_helper'
require 'classes/shared_gpgkey'
require 'classes/shared_base'
require 'classes/shared_source'
require 'classes/shared_debuginfo'
require 'classes/shared_testing'
require 'classes/shared_testing_source'
require 'classes/shared_testing_debuginfo'
require 'classes/shared_playground'
require 'classes/shared_playground_debug'

describe 'epel' do
  test_on = {
    supported_os: [
      {
        'operatingsystem' => 'RedHat',
        'operatingsystemrelease' => %w[6 7 8]
      }
    ]
  }
  on_supported_os(test_on).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('epel') }
      it { is_expected.to contain_class('epel::params') }

      case os_facts[:operatingsystemmajrelease]
      when '6'
        it_behaves_like 'base 6'
        it_behaves_like 'gpgkey 6'
        it_behaves_like 'epel source 6'
        it_behaves_like 'epel debuginfo 6'
        it_behaves_like 'epel testing 6'
        it_behaves_like 'epel testing source 6'
        it_behaves_like 'epel testing debuginfo 6'

        context 'epel_baseurl => https://example.com/epel/6/x86_64' do
          let(:params) do
            {
              epel_baseurl: 'https://example.com/epel/6/x86_64'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(baseurl: 'https://example.com/epel/6/x86_64') }
          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_mirrorlist => absent' do
          let(:params) do
            {
              epel_mirrorlist: 'absent'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_username/password' do
          let(:params) do
            {
              epel_username: 'user',
              epel_password: 'password',
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(username: 'user') }
          it { is_expected.to contain_yumrepo('epel').with(password: 'password') }
        end
      when '7'
        it_behaves_like 'base 7'
        it_behaves_like 'gpgkey 7'
        it_behaves_like 'epel source 7'
        it_behaves_like 'epel debuginfo 7'
        it_behaves_like 'epel testing 7'
        it_behaves_like 'epel testing source 7'
        it_behaves_like 'epel testing debuginfo 7'

        context 'epel_baseurl => https://example.com/epel/7/x86_64' do
          let(:params) do
            {
              epel_baseurl: 'https://example.com/epel/7/x86_64'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(baseurl: 'https://example.com/epel/7/x86_64') }
          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_mirrorlist => absent' do
          let(:params) do
            {
              epel_mirrorlist: 'absent'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_username/password' do
          let(:params) do
            {
              epel_username: 'user',
              epel_password: 'password',
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(username: 'user') }
          it { is_expected.to contain_yumrepo('epel').with(password: 'password') }
        end
      when '8'
        it_behaves_like 'base 8'
        it_behaves_like 'gpgkey 8'
        it_behaves_like 'epel source 8'
        it_behaves_like 'epel debuginfo 8'
        it_behaves_like 'epel testing 8'
        it_behaves_like 'epel testing source 8'
        it_behaves_like 'epel testing debuginfo 8'
        it_behaves_like 'epel playground 8'
        it_behaves_like 'epel playground debug 8'
        context 'epel_baseurl => https://example.com/epel/8/x86_64' do
          let(:params) do
            {
              epel_baseurl: 'https://example.com/epel/8/x86_64'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(baseurl: 'https://example.com/epel/8/x86_64') }
          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_mirrorlist => absent' do
          let(:params) do
            {
              epel_mirrorlist: 'absent'
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(mirrorlist: 'absent') }
        end

        context 'epel_username/password' do
          let(:params) do
            {
              epel_username: 'user',
              epel_password: 'password',
            }
          end

          it { is_expected.to contain_yumrepo('epel').with(username: 'user') }
          it { is_expected.to contain_yumrepo('epel').with(password: 'password') }
        end
      end
    end
  end
  context 'on unsupported OSes' do
    # On Fedora and other non RedHat systems, including `epel` is a no-op, but should still compile.
    test_on = {
      supported_os: [ # Unfortunate misnomer
        {
          'operatingsystem' => 'Fedora',
          'operatingsystemrelease' => %w[28 29 30]
        },
        {
          'operatingsystem' => 'Debian',
          'operatingsystemrelease' => %w[8 9 10]
        },
        {
          'operatingsystem' => 'Ubuntu',
          'operatingsystemrelease' => %w[16.04 18.04]
        }
      ]
    }
    on_supported_os(test_on).each do |os, os_facts|
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to contain_class('epel') }
        it { is_expected.to have_resource_count(0) }
      end
    end
  end
end
