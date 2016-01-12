require 'spec_helper.rb'

describe 'grafana::docker::container' do
  context 'with defaults for all parameters' do
    let(:title) { 'grafana-dashboard' }
    it { should compile }
    it { should contain_docker_systemd__container('grafana-dashboard').with({ 'image' => 'grafana' }) }
  end
end
