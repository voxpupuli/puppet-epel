require 'spec_helper'
require 'classes/shared_gpgkey'
require 'classes/shared_base'
require 'classes/shared_source'
require 'classes/shared_debuginfo'
require 'classes/shared_testing'
require 'classes/shared_testing_source'
require 'classes/shared_testing_debuginfo'

describe 'epel' do
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

      it { is_expected.to contain_class('epel') }
      it { is_expected.to contain_class('epel::params') }

      case os_facts[:operatingsystemmajrelease]
      when '5'
        it_behaves_like :base_5
        it_behaves_like :gpgkey_5
        it_behaves_like :epel_source_5
        it_behaves_like :epel_debuginfo_5
        it_behaves_like :epel_testing_5
        it_behaves_like :epel_testing_source_5
        it_behaves_like :epel_testing_debuginfo_5
      when '6'
        it_behaves_like :base_6
        it_behaves_like :gpgkey_6
        it_behaves_like :epel_source_6
        it_behaves_like :epel_debuginfo_6
        it_behaves_like :epel_testing_6
        it_behaves_like :epel_testing_source_6
        it_behaves_like :epel_testing_debuginfo_6

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
      when '7'
        it_behaves_like :base_7
        it_behaves_like :gpgkey_7
        it_behaves_like :epel_source_7
        it_behaves_like :epel_debuginfo_7
        it_behaves_like :epel_testing_7
        it_behaves_like :epel_testing_source_7
        it_behaves_like :epel_testing_debuginfo_7

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
      when '8'
        it_behaves_like :base_8
        it_behaves_like :gpgkey_8
        it_behaves_like :epel_source_8
        it_behaves_like :epel_debuginfo_8
        it_behaves_like :epel_testing_8
        it_behaves_like :epel_testing_source_8
        it_behaves_like :epel_testing_debuginfo_8
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
      end
    end
  end
  context 'on unsupported OSes' do
    # On Fedora and other non RedHat systems, including `epel` is a no-op, but should still compile.
    test_on = {
      supported_os: [ # Unfortunate misnomer
        {
          'operatingsystem'        => 'Fedora',
          'operatingsystemrelease' => %w[28 29 30]
        },
        {
          'operatingsystem'        => 'Debian',
          'operatingsystemrelease' => %w[8 9 10]
        },
        {
          'operatingsystem'        => 'Ubuntu',
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
