require 'spec_helper.rb'

describe 'grafana::docker::data_volume_container' do
  context 'with defaults for all parameters' do
    let(:title) { 'grafana-data' }
    it { should compile }
    it {
      should contain_docker_systemd__data_volume_container('grafana-data').with(
        { 'image' => 'ajsmith/grafana' })
    }
  end
end
