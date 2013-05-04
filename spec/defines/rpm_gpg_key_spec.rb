require 'spec_helper'

%w{ 6.4 5.9 }.each do |os_version|
  os_maj_version = os_version.split('.')[0]

  describe 'epel::rpm_gpg_key' do
    include_context :default_facts

    let :facts do
      {
        :operatingsystemrelease => os_version,
        :os_maj_version         => os_maj_version,
      }.merge(default_facts)
    end
    
    let :title do
      "EPEL-#{os_maj_version}"
    end
  
    let :params do
      { :path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{os_maj_version}" }
    end

    it do
      should contain_exec("import-#{title}").with({
        'path'      => '/bin:/usr/bin:/sbin:/usr/sbin',
        'command'   => "rpm --import #{params[:path]}",
        'unless'    => "rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < #{params[:path]}) | cut --characters=11-18 | tr [A-Z] [a-z])",
        'require'   => "File[#{params[:path]}]",
        'logoutput' => 'on_failure',
      })
    end
  end
end
