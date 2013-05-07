require 'spec_helper'
require 'classes/shared_gpgkey'
require 'classes/shared_base'
require 'classes/shared_source'
require 'classes/shared_debuginfo'
require 'classes/shared_testing'
require 'classes/shared_testing_source'
require 'classes/shared_testing_debuginfo'

describe 'epel' do
  it { should contain_class('epel::params') }

  context 'os_maj_version => 6' do
    include_context :default_facts
    include_context :gpgkey_6
    include_context :base_6
    include_context :epel_source_6
    include_context :epel_debuginfo_6
    include_context :epel_testing_6
    include_context :epel_testing_source_6
    include_context :epel_testing_debuginfo_6

    let :facts do
      {
        :operatingsystemrelease => '6.4',
        :os_maj_version         => '6',
      }.merge(default_facts)
    end
  end

  context 'os_maj_version => 5' do
    include_context :default_facts
    include_context :gpgkey_5
    include_context :base_5
    include_context :epel_source_5
    include_context :epel_debuginfo_5
    include_context :epel_testing_5
    include_context :epel_testing_source_5
    include_context :epel_testing_debuginfo_5

    let :facts do
      {
        :operatingsystemrelease => '5.9',
        :os_maj_version         => '5',
      }.merge(default_facts)
    end
  end
end