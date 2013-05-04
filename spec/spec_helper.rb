require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.formatter = :documentation
end

shared_context :default_facts do
  let(:default_facts) {
    {
      :osfamily               => 'RedHat',
      :architecture           => 'x86_64',
    }
  }
end
