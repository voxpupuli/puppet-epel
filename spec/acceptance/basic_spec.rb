require 'spec_helper_acceptance'

describe 'epel' do
  let(:pp) do
    'include epel'
  end

  it_behaves_like 'an idempotent manifest'
  it_behaves_like 'EPEL is available'
end
