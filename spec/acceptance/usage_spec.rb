# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'usage tests' do
  describe 'epel baseurl and mirrorlist' do
    let(:baseurl) do
      release = if fact('os.release.major').to_i < 10
                  fact('os.release.major')
                elsif fact('os.name') == 'CentOS'
                  "#{fact('os.release.major')}s"
                else
                  fact('os.release.full')
                end
      "https://dl.fedoraproject.org/pub/epel/#{release}/Everything/x86_64/"
    end

    # Metalink must be absent too, or dnf ignores the baseurl.
    let(:manifest) do
      <<-PP
      class { 'epel':
        epel_baseurl    => '#{baseurl}',
        epel_mirrorlist => 'absent',
        epel_metalink   => 'absent',
      }
      PP
    end

    it_behaves_like 'an idempotent resource'
    it_behaves_like 'EPEL is available'

    describe command('/usr/bin/dnf config-manager --dump epel') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match %r{^baseurl = #{Regexp.escape(baseurl)}} }
      its(:stdout) { is_expected.not_to include('mirrorlist') }
      its(:stdout) { is_expected.not_to match %r{^metalink = \S} }
    end
  end

  describe 'epel-testing' do
    let(:manifest) do
      <<-PP
      class { 'epel':
        epel_testing_enabled => '1',
      }
      PP
    end

    it_behaves_like 'an idempotent resource'
    it_behaves_like 'EPEL is available'

    describe command('/usr/bin/dnf config-manager --dump epel') do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match %r{^enabled = (True|1)\s*$} }
    end
  end
end
