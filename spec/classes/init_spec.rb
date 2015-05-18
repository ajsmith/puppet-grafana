require 'spec_helper.rb'

describe 'grafana' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should contain_class('grafana') }
  end
end
