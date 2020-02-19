require 'spec_helper_acceptance'

describe 'usage tests' do
  describe 'epel baseurl and mirrorlist' do
    let(:pp) do
      <<-PP
      class { 'epel':
        epel_baseurl    => 'http://dl.fedoraproject.org/pub/epel/#{fact('os.release.major')}/x86_64/',
        epel_mirrorlist => 'absent',
      }
      PP
    end

    it_behaves_like 'an idempotent manifest'
    it_behaves_like 'EPEL is available'

    command = if fact('os.release.major') == '8'
                '/usr/bin/yum-config-manager --dump epel'
              else
                '/usr/bin/yum-config-manager epel'
              end
    expected_baseurl_regex = if fact('os.release.major') == '8'
                               %r{^baseurl = \[http://dl\.fedoraproject\.org/pub/epel/#{fact('os.release.major')}/x86_64/\]}
                             else
                               %r{^baseurl = http://dl\.fedoraproject\.org/pub/epel/#{fact('os.release.major')}/x86_64/}
                             end

    describe command(command) do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match expected_baseurl_regex }
    end

    if fact('os.release.major') == '8'
      describe command(command) do
        its(:exit_status) { is_expected.to eq 0 }
        its(:stdout) { is_expected.not_to include('mirrorlist') }
      end
    else
      describe command(command) do
        its(:exit_status) { is_expected.to eq 0 }
        its(:stdout) { is_expected.to match %r{^mirrorlist =\s*$} }
      end
    end
  end

  describe 'epel-testing' do
    let(:pp) do
      <<-PP
      class { 'epel':
        epel_testing_enabled => '1',
      }
      PP
    end

    it_behaves_like 'an idempotent manifest'
    it_behaves_like 'EPEL is available'

    command = if fact('os.release.major') == '8'
                '/usr/bin/yum-config-manager --dump epel'
              else
                '/usr/bin/yum-config-manager epel'
              end

    describe command(command) do
      its(:exit_status) { is_expected.to eq 0 }
      its(:stdout) { is_expected.to match %r{^enabled = (True|1)\s*$} }
    end
  end
end
