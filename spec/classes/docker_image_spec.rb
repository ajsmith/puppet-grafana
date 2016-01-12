require 'spec_helper.rb'

describe 'grafana::docker::image' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should contain_class('grafana::docker::image') }
    it { should contain_file('/opt/docker-grafana/grafana.ini') }
    it { should contain_docker__image('grafana') }
  end
end
