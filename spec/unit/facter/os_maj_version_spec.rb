require 'spec_helper'

describe 'os_maj_version' do
  before  { Facter.clear }
  after   { Facter.clear }

  %w{ 6.4 5.9 }.each do |os_version|
    context "operatingsystemrelease => #{os_version}" do
      major = os_version.split('.')[0]
      it "Should have a major version #{major}" do
        Facter.fact(:operatingsystemrelease).stubs(:value).returns os_version
        Facter.fact(:os_maj_version).value.should == major
      end
    end
  end
end
